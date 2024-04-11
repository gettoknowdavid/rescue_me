import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/services/auth_service.dart';

import '../models/user.dart';

class NotificationsService {
  User? get _user => locator<AuthService>().user;

  Stream<List<Notification?>> getNotifications([bool isRead = false]) async* {
    final ref = usersRef.doc(_user!.uid).notifications;
    yield* ref.whereRead(isEqualTo: isRead).snapshots().map(mapStreamList);
  }

  List<Notification?> mapStreamList(NotificationQuerySnapshot snapshot) {
    return snapshot.docs.map((e) => e.data).toList();
  }
}
