import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:rescue_me/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();
  final _preferences = locator<SharedPreferencesService>();

  void goToLogin() {
    if (!_preferences.onboarded) {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.popRepeated(1);
    }
  }

  bool get disabled =>
      !isFormValid || !hasName || !hasEmail || !hasPassword || isBusy;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get _networkStatus => _networkService.status;

  Future<void> register() async {
    if (_networkStatus == NetworkStatus.disconnected) {
      return;
    }

    if (hasEmail && hasPassword) {
      final result = await runBusyFuture(
        _authService.register(
          email: emailValue!,
          password: passwordValue!,
          name: nameValue!,
        ),
      );

      return result.fold(
        (failure) => _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => keServer,
            emailInUse: (_) => keEmailAlreadyInUse,
            timeOut: (_) => keTimeout,
          ),
        ),
        (_) => _navigationService.clearStackAndShow(Routes.verifyEmailView),
      );
    }
  }
}
