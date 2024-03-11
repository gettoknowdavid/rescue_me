import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:stacked/stacked.dart';

import '../core/constants/constants.dart';
import '../core/errors/auth_error.dart';

class AuthService with ListenableServiceMixin {
  final _firebaseAuth = FirebaseAuth.instance;

  final _user = ReactiveValue<User?>(null);
  final _isAuthenticated = ReactiveValue<bool>(false);
  final _isVerified = ReactiveValue<bool>(false);

  AuthService() {
    listenToReactiveValues([_user]);
    _firebaseAuth.userChanges().listen((event) {
      _user.value = event;

      if (event != null) {
        _isAuthenticated.value = true;
        _isVerified.value = event.emailVerified;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  User? get user => _user.value;

  bool get isAuthenticated => _isAuthenticated.value;

  bool get isVerified => _isVerified.value;

  Future<Either<AuthError, Unit>> forgotPassword(String email) async {
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(email: email)
          .timeout(timeLimit);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthError.userNotFound());
        case 'invalid-credential':
          return left(const AuthError.invalidEmail());
        default:
          return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Option<Either<AuthError, bool>>> checkEmailVerified() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      _isVerified.value == false;
      notifyListeners();
      return optionOf(null);
    }

    await firebaseUser.reload();

    if (firebaseUser.emailVerified) {
      _isVerified.value = true;
      notifyListeners();
      return optionOf(right(true));
    } else {
      _isVerified.value = false;
      notifyListeners();
      return optionOf(left(const AuthError.notVerified()));
    }
  }

  Future<Either<AuthError, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(timeLimit);

      _user.value = result.user;

      notifyListeners();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          return left(const AuthError.invalidEmailOrPassword());
        default:
          return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _user.value = null;
    notifyListeners();
  }

  Future<Either<AuthError, Unit>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(timeLimit);

      await _firebaseAuth.currentUser!.updateDisplayName(name);
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: _firebaseAuth.currentUser!.updatePhoneNumber,
        verificationFailed: (error) {},
        codeSent: (verificationId, forceResendingToken) {},
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      await _firebaseAuth.currentUser?.reload();

      _user.value = _firebaseAuth.currentUser;

      notifyListeners();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else {
        return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> changeAvatar(String? photoURL) async {
    try {
      await _firebaseAuth.currentUser!.updatePhotoURL(photoURL);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<void> reload() async {
    if (_firebaseAuth.currentUser == null) return;
    return _firebaseAuth.currentUser!.reload().then((_) => notifyListeners());
  }

  Future<Either<AuthError, Unit>> changeName(String name) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName(name);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> removeAvatar() async {
    try {
      await _firebaseAuth.currentUser!.updatePhotoURL(' ');
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  bool get hasAvatar => _firebaseAuth.currentUser?.photoURL != null;
}
