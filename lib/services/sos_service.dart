import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/core/errors/cloud_error.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../models/emergency_status.dart';

class SosService with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _networkService = locator<NetworkService>();

  User? get user => _authService.user;

  Future<List<EmergencyReport?>> getMySOSReports() async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('emergency_reports')
        .orderBy('closedAt', descending: true)
        .get();
    return result.docs.map((e) => EmergencyReport.fromJson(e.data())).toList();
  }

  Future<EmergencyReport?> getSOSByUserId(String sosId, String userId) async {
    final res = await usersRef.doc(userId).emergencyReports.doc(sosId).get();
    return res.data;
  }

  Stream<EmergencyReport?> get emergency async* {
    final ref = usersRef.doc(user!.uid).emergencyReports;
    yield* ref
        .whereStatus(whereIn: [EmergencyStatus.pending])
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).first);
  }

  Future<Either<CloudError, Unit>> createEmergency(
    EmergencyReport report,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      final ref = usersRef.doc(user!.uid).emergencyReports;
      await ref.doc(report.uid).set(report);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> updateEmergency(
    EmergencyReport report,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      final ref = usersRef.doc(user!.uid).emergencyReports;
      await ref.doc(report.uid).set(report);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> closeEmergency(
    EmergencyReport report,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      final newReport = report.copyWith(
        status: EmergencyStatus.resolved,
        closedAt: DateTime.now(),
      );
      final ref = usersRef.doc(user!.uid).emergencyReports;
      await ref.doc(report.uid).set(newReport);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<User?> _findUserByPhone(String phone) async {
    final result = await usersRef.wherePhoneNumber(isEqualTo: phone).get();
    return result.docs.first.data;
  }

  Future<void> notifyEmergencyContacts(EmergencyReport sos) async {
    final ref = await usersRef.doc(user!.uid).emergencyContacts.get();
    final contacts = ref.docs.map((e) => e.data).toList();
    for (var contact in contacts) {
      final contactUser = await _findUserByPhone(contact.phone);

      while (contactUser != null) {
        final notRef = usersRef.doc(contactUser.uid).notifications;
        final newNotification = Notification(
          uid: const Uuid().v4(),
          title: 'SOS Emergency',
          sosId: sos.uid,
          specialMessage: sos.description,
          recipientId: user!.uid,
          recipientName: user!.name,
          recipientPhone: user!.phoneNumber!,
          recipientPhotoURL: user!.photoURL,
          createdAt: DateTime.now(),
        );
        await notRef.doc(newNotification.uid).set(newNotification);
      }
    }
  }
}
