import 'package:dartz/dartz.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/core/errors/auth_error.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  User get user => _authService.user!;

  Future<void> logout() async {
    _navService.clearStackAndShow(Routes.loginView);
    await _authService.logout();
  }

  Future<void> goToEditBio() => _navService.navigateToEditBioView();

  Future<void> goToEditPassword() => _navService.navigateToEditPasswordView();

  Future<void> goToUpdatePhone() async {
    final confirmationResponse = await _navService.navigateToReAuthView();

    if (confirmationResponse is AuthError) {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.error,
        message: confirmationResponse.maybeMap(
          orElse: () => '',
          serverError: (_) => keServer,
          error: (value) => value.message ?? 'Some funny kind of error',
          timeOut: (_) => keTimeout,
        ),
      );
    }

    if (confirmationResponse is Unit) {
      _navService.navigateToUpdatePhoneView();
    }
  }

  Future<void> goToEditEmail() async {
    final confirmationResponse = await _navService.navigateToReAuthView();
    if (confirmationResponse is AuthError) {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.error,
        message: confirmationResponse.maybeMap(
          orElse: () => '',
          serverError: (_) => keServer,
          error: (value) => value.message ?? 'Some funny kind of error',
          timeOut: (_) => keTimeout,
        ),
      );
    }

    if (confirmationResponse is Unit) {
      _navigationService.navigateToEditEmailView();
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
