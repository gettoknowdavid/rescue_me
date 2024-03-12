import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.dialogs.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_email_view.form.dart';

class EditEmailViewModel extends FormViewModel with ListenableServiceMixin {
  EditEmailViewModel() {
    listenToReactiveValues([_email, _sent]);

    _email.value = _authService.user?.email;
  }

  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  User get user => _authService.user!;

  final _email = ReactiveValue<String?>(null);
  String? get email => _email.value;

  final _sent = ReactiveValue<bool>(false);

  bool get disabled => !isFormValid || !hasEmail || isBusy || _sent.value;

  Future<void> next() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }

    if (emailValue != null && emailValue != _email.value) {
      final result = await runBusyFuture(_authService.updateEmail(emailValue!));

      return result.fold(
        (failure) => _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => keServer,
            error: (value) => value.message ?? 'Some funny kind of error',
            timeOut: (_) => keTimeout,
          ),
        ),
        (success) {
          _sent.value = true;
          _dialogService.showCustomDialog(
            variant: DialogType.logout,
            description: emailValue,
            title: 'Verification sent',
          );
        },
      );
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
