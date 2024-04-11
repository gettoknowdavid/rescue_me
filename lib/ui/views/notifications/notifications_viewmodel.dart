import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/services/notifications_service.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user.dart';

class NotificationsViewModel extends StreamViewModel<List<Notification?>>
    with ListenableServiceMixin {
  NotificationsViewModel() {
    listenToReactiveValues([_isRead]);
  }

  final _isRead = ReactiveValue(false);
  bool get isRead => _isRead.value;

  final _notificationsService = locator<NotificationsService>();

  @override
  // TODO: implement stream
  Stream<List<Notification?>> get stream =>
      _notificationsService.getNotifications();
}
