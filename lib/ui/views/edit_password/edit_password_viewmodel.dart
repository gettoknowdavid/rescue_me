import 'package:rescue_me/app/app.dialogs.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_password_view.form.dart';

class EditPasswordViewModel extends FormViewModel with ListenableServiceMixin {
  EditPasswordViewModel() {
    listenToReactiveValues([_sent]);
  }

  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  final _sent = ReactiveValue<bool>(false);
  bool get sent => _sent.value;

  bool get hasPassword => hasOldPassword && hasNewPassword;

  bool get disabled => !isFormValid || !hasPassword || isBusy || _sent.value;

  Future<void> submit() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }

    if (hasPassword) {
      final result = await runBusyFuture(
        _authService.updatePassword(
          newPassword: newPasswordValue!,
          oldPassword: oldPasswordValue!,
        ),
      );

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
            barrierDismissible: false,
          );
        },
      );
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];
}
