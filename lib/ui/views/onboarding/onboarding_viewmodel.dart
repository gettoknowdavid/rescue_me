import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/core/constants/app_keys.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();

  Future<void> goToLogin() async {
    await onDone().whenComplete(_navigationService.navigateToLoginView);
  }

  Future<void> goToRegister() async {
    await onDone().whenComplete(_navigationService.navigateToRegisterView);
  }

  Future<void> onDone() => _preferences.write(key: kKInit, value: 1);
}
