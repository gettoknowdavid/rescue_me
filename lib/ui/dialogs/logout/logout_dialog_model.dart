import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LogoutDialogModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> logout() async {
    _navigationService.clearStackAndShow(Routes.loginView);
    await _authService.logout();
  }

  void cancel() => _navigationService.popRepeated(2);

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
