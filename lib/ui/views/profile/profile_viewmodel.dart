import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/core/errors/auth_error.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  User get user => _authService.user!;

  Future<void> goToEditBio() async => _navService.navigateToEditBioView();

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
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
