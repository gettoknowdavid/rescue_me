import 'dart:async';

import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/app.snackbars.dart';
import '../../../services/auth_service.dart';
import '../../../services/open_mail_app_service.dart';

class VerifyEmailViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _openMailAppService = locator<OpenMailAppService>();

  Timer? timer;

  bool get isAuthenticated => _authService.isAuthenticated;

  bool? get isVerified => _authService.isVerified;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> cancel() async {
    await _authService.logout();
    await _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> checkEmailVerified() async {
    final result = await _authService.checkEmailVerified();
    result.fold(
      () => _navigationService.clearStackAndShow(Routes.loginView),
      (either) => either.fold(
        (_) => null,
        (_) => _navigationService.clearStackAndShow(Routes.verifyPhoneView),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Future<void> initialise() async {
    if (isVerified == false) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        await checkEmailVerified();
      });
    }
  }

  Future<void> openMailApp() => _openMailAppService.openMailApp();

  Future<void> sendVerification() async {
    final result = await _authService.sendVerificationEmail();

    result.fold(
      (failure) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            error: (value) => value.message ?? '',
            timeOut: (_) => keTimeout,
          ),
        );
      },
      (success) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.success,
          message: ksVerificationSent,
        );
      },
    );
  }
}
