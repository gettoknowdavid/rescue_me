import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/core/errors/cloud_error.dart';
import 'package:rescue_me/models/emergency_contact.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';

class EmergencyContactsService with ListenableServiceMixin {
  final _mediaService = locator<MediaService>();
  final _networkService = locator<NetworkService>();

  EmergencyContactsService() {
    listenToReactiveValues([_contacts, _isLoading]);
  }

  final _contacts = ReactiveValue<List<EmergencyContact?>>([]);
  List<EmergencyContact?> get contacts => _contacts.value;

  final _isLoading = ReactiveValue<bool>(false);
  bool get isLoading => _isLoading.value;

  Future<void> getEmergencyContacts() async {
    _isLoading.value = true;
    final result =
        await emergencyContactsRef.orderByIsPriority(descending: true).get();
    final list = result.docs.map((e) => e.data).toList();
    _contacts.value = list;
    _isLoading.value = false;
    notifyListeners();
  }

  Future<Either<CloudError, EmergencyContact?>> createEmergencyContact(
    EmergencyContact contact,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      await emergencyContactsRef.doc(contact.uid).set(contact);
      final result = await emergencyContactsRef.doc(contact.uid).get();
      await getEmergencyContacts();
      return right(result.data);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, EmergencyContact?>> updateEmergencyContact(
    EmergencyContact contact,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }
    final uid = contact.uid;

    try {
      await emergencyContactsRef.doc(uid).set(contact);
      final result = await emergencyContactsRef.doc(uid).get();
      await getEmergencyContacts();
      return right(result.data);
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
      await emergencyContactsRef.doc(contact.uid).delete().then((_) async {
        if (contact.imageUrl != null) {
          final path = 'images/emc/${contact.uid}';
          await _mediaService.storageRef.child(path).delete();
        }
      });
      await getEmergencyContacts();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }
}
