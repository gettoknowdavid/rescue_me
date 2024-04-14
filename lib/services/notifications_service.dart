import 'package:rescue_me/app/app.locator.dart';

import '../models/user.dart';
import 'auth_service.dart';

class NotificationsService {
  User? get _user => locator<AuthService>().user;

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
