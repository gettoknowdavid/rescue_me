import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'password_recovery_view.form.dart';

class PasswordRecoveryViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  bool get disabled => isBusy || !isFormValid || !hasEmail;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get _networkStatus => _networkService.status;

  Future<void> submit() async {
    if (_networkStatus == NetworkStatus.disconnected) {
      return;
    }

    if (hasEmail) {
      final result = await runBusyFuture(
        _authService.forgotPassword(emailValue!),
      );

      return result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              serverError: (_) => keServer,
              invalidEmail: (_) => keInvalidEmail,
            ),
          );
        },
        (_) => _navigationService.clearStackAndShow(Routes.confirmationView),
      );
    }
  }
}
