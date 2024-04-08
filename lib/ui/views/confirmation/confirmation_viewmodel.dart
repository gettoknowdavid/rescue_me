import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ConfirmationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToLogin() => _navigationService.clearStackAndShow(Routes.loginView);
}
