import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/user.dart';
import 'package:stacked/stacked.dart';

import '../core/constants/constants.dart';
import '../core/errors/auth_error.dart';

class AuthService with ListenableServiceMixin {
  final _firebaseAuth = fAuth.FirebaseAuth.instance;

  final _user = ReactiveValue<User?>(null);
  final _isAuthenticated = ReactiveValue<bool>(false);
  final _isVerified = ReactiveValue<bool>(false);
  final _hasPhoneNumber = ReactiveValue<bool>(false);

  AuthService() {
    listenToReactiveValues([
      _user,
      _isAuthenticated,
      _isVerified,
      _hasPhoneNumber,
    ]);
    _firebaseAuth.userChanges().listen((fAuth.User? event) {
      _user.value = event?.toUser;

      if (event != null) {
        _isAuthenticated.value = true;
        _isVerified.value = event.emailVerified;
        _hasPhoneNumber.value = event.phoneNumber?.isEmpty == false;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  User? get user => _user.value;

  bool get isAuthenticated => _isAuthenticated.value;

  bool get isVerified => _isVerified.value;

  bool get hasPhoneNumber => _hasPhoneNumber.value;

  Future<Either<AuthError, Unit>> forgotPassword(String email) async {
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(email: email)
          .timeout(timeLimit);
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
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

      _user.value = result.user?.toUser;

      notifyListeners();

      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
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
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((c) async {
        await c.user!.updateDisplayName(name);

        await _firebaseAuth.currentUser?.reload();

        final currentUser = _firebaseAuth.currentUser;

        await usersRef.doc(currentUser!.uid).set(currentUser.toUser);

        _user.value = currentUser.toUser;

        await _firebaseAuth.currentUser?.sendEmailVerification();
      }).timeout(timeLimit);

      notifyListeners();

      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else {
        return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<void> verifyPhone({
    String? phoneNumber,
    required void Function(fAuth.PhoneAuthCredential) verificationCompleted,
    required void Function(fAuth.FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<Either<AuthError, Unit>> updatePhone({
    required String phone,
    required fAuth.PhoneAuthCredential credential,
  }) async {
    try {
      await _firebaseAuth.currentUser!.updatePhoneNumber(credential);

      await _firebaseAuth.currentUser?.reload();

      final currentUser = _firebaseAuth.currentUser;
      final updatedUser = currentUser!.toUser.copyWith(phoneNumber: phone);
      await usersRef.doc(currentUser.uid).set(updatedUser);
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> changeAvatar(String? photoURL) async {
    try {
      await _firebaseAuth.currentUser!.updatePhotoURL(photoURL);
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
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
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> removeAvatar() async {
    try {
      await _firebaseAuth.currentUser!.updatePhotoURL(' ');
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  bool get hasAvatar => _firebaseAuth.currentUser?.photoURL != null;

  Future<Either<AuthError, Unit>> reauthenticate(String password) async {
    try {
      final credential = fAuth.EmailAuthProvider.credential(
        email: _firebaseAuth.currentUser!.email!,
        password: password,
      );
      await _firebaseAuth.currentUser!
          .reauthenticateWithCredential(credential)
          .timeout(timeLimit);
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> updateEmail(String email) async {
    try {
      await _firebaseAuth.currentUser!
          .verifyBeforeUpdateEmail(email)
          .timeout(timeLimit);
      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<Either<AuthError, Unit>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final credential = fAuth.EmailAuthProvider.credential(
        email: _firebaseAuth.currentUser!.email!,
        password: oldPassword,
      );

      await _firebaseAuth.currentUser!
          .reauthenticateWithCredential(credential)
          .then((res) async => await res.user?.updatePassword(newPassword))
          .timeout(timeLimit);

      return right(unit);
    } on fAuth.FirebaseAuthException catch (e) {
      return left(AuthError.error(e.message));
    } on TimeoutException {
      return left(const AuthError.error(keTimeout));
    }
  }

  Future<User> getUserById(String userId) async {
    try {
      final snapshot = await usersRef.doc(userId).get();
      return snapshot.data!;
    } catch (e) {
      throw Exception('User not found.');
    }
  }
}
