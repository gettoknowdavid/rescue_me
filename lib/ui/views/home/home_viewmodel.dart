import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  void goToOnboarding() => _navigationService.navigateTo(Routes.onboardingView);
}
