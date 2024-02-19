import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  String? get firstName => user?.displayName?.split(' ')[0];

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
          LayoutViewRoutes.contactView,
          id: 1,
        );
        break;
      case 2:
        setIndex(2);
        _navigationService.pushNamedAndRemoveUntil(
          LayoutViewRoutes.profileView,
          id: 1,
        );
        break;
      case 3:
        setIndex(3);
        _navigationService.pushNamedAndRemoveUntil(
          LayoutViewRoutes.settingsView,
          id: 1,
        );
        break;
      default:
    }
    notifyListeners();
  }
}
