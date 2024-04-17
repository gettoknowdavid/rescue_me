import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/core/errors/cloud_error.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';

class EmergencyContactsService with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _mediaService = locator<MediaService>();
  final _networkService = locator<NetworkService>();

  EmergencyContactsService() {
    listenToReactiveValues([_contacts]);
  }

  final _contacts = ReactiveValue<List<EmergencyContact?>>([]);
  List<EmergencyContact?> get contacts => _contacts.value;

  Future<User?> isContactRegistered(String phoneNumber) async {
    final user = await usersRef.wherePhoneNumber(isEqualTo: phoneNumber).get();
    return user.docs.first.data;
  }

  User? get user => _authService.user;

  Stream<List<EmergencyContact?>> get contactsStream async* {
    final ref = usersRef.doc(user!.uid).emergencyContacts;
    yield* ref.snapshots().map((e) {
      final result = e.docs.map((e) => e.data).toList();
      _contacts.value = result;
      notifyListeners();
      return result;
    });
  }

  Future<Either<CloudError, Unit>> createEmergencyContact(
    EmergencyContact contact,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      final ref = usersRef.doc(user!.uid).emergencyContacts;
      final cUser = await isContactRegistered(contact.phone);
      final newContact = contact.copyWith(
        isRegistered: cUser != null,
        userId: cUser?.uid,
      );
      await ref.doc(contact.uid).set(newContact);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> updateEmergencyContact(
    EmergencyContact contact,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }
    final uid = contact.uid;

    try {
      final ref = usersRef.doc(user!.uid).emergencyContacts;
      await ref.doc(uid).set(contact);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> deleteEmergencyContact(
    EmergencyContact contact,
  ) async {
    try {
      final ref = usersRef.doc(user!.uid).emergencyContacts;
      await ref.doc(contact.uid).delete().then((_) async {
        if (contact.imageUrl != null) {
          final path = 'images/emc/${contact.uid}';
          await _mediaService.storageRef.child(path).delete();
        }
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }
}
