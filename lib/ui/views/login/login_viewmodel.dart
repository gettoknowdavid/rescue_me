import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:rescue_me/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();
  final _preferences = locator<SharedPreferencesService>();

  bool get disabled => !isFormValid || !hasEmail || !hasPassword || isBusy;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  void goToPasswordRecovery() =>
      _navigationService.navigateToPasswordRecoveryView();

  void goToRegister() {
    if (!_preferences.onboarded) {
      _navigationService.replaceWithRegisterView();
    } else {
      _navigationService.navigateToRegisterView();
    }
  }

  NetworkStatus get _networkStatus => _networkService.status;

  Future<void> login() async {
    if (_networkStatus == NetworkStatus.disconnected) {
      return;
    }

    if (hasEmail && hasPassword) {
      final result = await runBusyFuture(
        _authService.login(email: emailValue!, password: passwordValue!),
      );

      return result.fold(
        (failure) => _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => keServer,
            invalidEmailOrPassword: (_) => keInvalidEmail,
            timeOut: (_) => keTimeout,
          ),
        ),
        (_) => _navigationService.clearStackAndShow(Routes.layoutView),
      );
    }
  }
}
