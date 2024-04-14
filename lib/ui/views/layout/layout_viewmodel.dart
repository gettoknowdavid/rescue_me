import 'package:rescue_me/app/app.dialogs.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/user.dart';
import '../../../services/auth_service.dart';
import '../../../services/notifications_service.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _notificationService = locator<NotificationsService>();

  Stream<bool> get hasNotifications => _notificationService.hasNotifications;

  String? get firstName => user?.name.split(' ')[0];

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  User? get user => _authService.user;

  bool get hasPhoto => user != null && user!.photoURL != null;
  String? get photoURL => user?.photoURL;

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        setIndex(0);
        _navigationService.pushNamedAndRemoveUntil(
          LayoutViewRoutes.homeView,
          id: 1,
        );
        break;
      case 1:
        setIndex(1);
        _navigationService.pushNamedAndRemoveUntil(
          LayoutViewRoutes.profileView,
          id: 1,
        );
        break;
      case 2:
        setIndex(2);
        _navigationService.pushNamedAndRemoveUntil(
          LayoutViewRoutes.settingsView,
          id: 1,
        );
        break;
      default:
    }
    notifyListeners();
  }

  Future<void> sos() async {
    await _dialogService.showCustomDialog(variant: DialogType.sos);
  }
}
