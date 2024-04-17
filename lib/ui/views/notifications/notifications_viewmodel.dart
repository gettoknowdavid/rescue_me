import 'package:rescue_me/app/app.bottomsheets.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/services/notifications_service.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/user.dart';

class NotificationsViewModel extends StreamViewModel<List<Notification?>>
    with ListenableServiceMixin {
  NotificationsViewModel() {
    listenToReactiveValues([_isRead, _isSOSLoading]);
  }

  @override
  void notifySourceChanged({bool clearOldData = false}) {
    super.notifySourceChanged(clearOldData: !_isRead.value);
  }

  final _isRead = ReactiveValue(false);
  bool get isRead => _isRead.value;

  final _isSOSLoading = ReactiveValue(false);
  bool get isSOSLoading => _isSOSLoading.value;

  final _bottomSheetService = locator<BottomSheetService>();
  final _notificationsService = locator<NotificationsService>();
  final _sosService = locator<SosService>();

  Future<void> showSOSBottomSheet({
    required String sosId,
    required String userId,
  }) async {
    _isSOSLoading.value = true;
    await _sosService.getSOSByUserId(sosId, userId).then((sos) {
      _isSOSLoading.value = false;
      _bottomSheetService.showCustomSheet<void, EmergencyReport>(
        variant: BottomSheetType.sos,
        takesInput: true,
        data: sos,
        useRootNavigator: true,
        isScrollControlled: true,
      );
    });
  }

  @override
  Stream<List<Notification?>> get stream =>
      _notificationsService.getNotifications(_isRead.value);
}
