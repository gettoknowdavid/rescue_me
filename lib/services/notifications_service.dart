import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';
import 'auth_service.dart';

class NotificationsService {
  User? get _user => locator<AuthService>().user;

  Future<List<EmergencyContact?>> myEmergencyContacts() async {
    final ref = usersRef.doc(_user!.uid).emergencyContacts;
    final result = await ref.whereIsRegistered(isEqualTo: true).get();
    return result.docs.map((e) => e.data).toList();
  }

  Future<void> sendNotifications(EmergencyReport sos) async {
    final contacts = await myEmergencyContacts();

    if (contacts.isNotEmpty) {
      Logger().w('Sending notifications to => $contacts');
      final batch = FirebaseFirestore.instance.batch();

      final uid = const Uuid().v4();
      final notification = Notification(
        uid: uid,
        title: '${_user!.name} is in an SOS emergency',
        sosId: sos.uid,
        recipientId: _user!.uid,
        recipientName: _user!.name,
        recipientPhone: _user!.phoneNumber!,
        createdAt: sos.createdAt,
      );

      for (var i = 0; i < contacts.length; i++) {
        final contact = contacts[i]!;
        final notificationRef = FirebaseFirestore.instance
            .collection('users')
            .doc(contact.userId)
            .collection('notifications')
            .doc(uid);

        batch.set(notificationRef, notification.toJson());
      }

      batch.commit();
    }
  }

  Stream<bool> get hasNotifications async* {
    final ref = usersRef.doc(_user!.uid).notifications;
    yield* ref
        .whereRead(isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.isNotEmpty);
  }

  Stream<int> get notificationNumber async* {
    final ref = usersRef.doc(_user!.uid).notifications;
    yield* ref
        .whereRead(isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.length);
  }

  Stream<List<Notification?>> getNotifications([bool isRead = false]) async* {
    final ref = usersRef.doc(_user!.uid).notifications;
    yield* ref.whereRead(isEqualTo: isRead).snapshots().map(mapStreamList);
  }

  List<Notification?> mapStreamList(NotificationQuerySnapshot snapshot) {
    return snapshot.docs.map((e) => e.data).toList();
  }
}
