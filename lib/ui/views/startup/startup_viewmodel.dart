import 'dart:async';

import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();

  bool get isAuthenticated => _authService.isAuthenticated;
  bool get isVerified => _authService.isVerified;
  bool get hasPhoneNumber => _authService.hasPhoneNumber;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  void goToView() {
    if (!_preferences.onboarded) {
      _navigationService.clearStackAndShow(Routes.onboardingView);
    } else {
      if (isAuthenticated && !isVerified) {
        _navigationService.replaceWithVerifyEmailView();
      }

      if (isAuthenticated && isVerified && !hasPhoneNumber) {
        _navigationService.replaceWithVerifyPhoneView();
      }

      if (isAuthenticated && isVerified && hasPhoneNumber) {
        _navigationService.replaceWithLayoutView();
      }

      if (!isAuthenticated) {
        _navigationService.replaceWithLoginView();
      }
    }
  }

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 5)).whenComplete(goToView);
  }
}
