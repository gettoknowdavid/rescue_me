import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'update_phone_view.form.dart';

class UpdatePhoneViewModel extends FormViewModel with ListenableServiceMixin {
  UpdatePhoneViewModel() {
    listenToReactiveValues([
      _codeSent,
      _isPhoneValid,
      _verificationId,
    ]);
  }
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  final _verificationId = ReactiveValue<String?>(null);
  String? get verificationId => _verificationId.value;

  final _codeSent = ReactiveValue<bool>(false);
  bool get codeSent => _codeSent.value;

  final _isPhoneValid = ReactiveValue<bool>(false);
  bool get isPhoneValid => _isPhoneValid.value;

  bool get disabled =>
      hasPhoneValidationMessage || !hasPhone || isBusy || !isPhoneValid;
  bool get codeBoxDisabled => !hasCode || hasCodeValidationMessage || isBusy;

  void onPhoneChanged(PhoneNumber phone) {
    _isPhoneValid.value = phone.isValidNumber();
    notifyListeners();
  }

  Future<void> verifyPhone() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }

    setBusy(true);

    if (phoneValue != null) {
      await _authService.verifyPhone(
        phoneNumber: phoneValue,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (p0) {},
        codeAutoRetrievalTimeout: (p0) {},
        codeSent: (verificationId, p1) {
          setBusy(false);
          _verificationId.value = verificationId;
          _codeSent.value = true;
          notifyListeners();
        },
      );
    }
  }

  Future<void> updatePhone() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }
    if (codeValue != null && _verificationId.value != null) {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.value!,
        smsCode: codeValue!,
      );
      final result = await runBusyFuture(_authService.updatePhone(
        phone: phoneValue!,
        credential: credential,
      ));
      return result.fold(
        (failure) => _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            error: (value) => value.message ?? 'Some errors',
            serverError: (_) => keServer,
            emailInUse: (_) => keEmailAlreadyInUse,
            timeOut: (_) => keTimeout,
          ),
        ),
        (_) => _authService.reload().whenComplete(_navigationService.back),
      );
    }
  }

  Future<void> resend() async => verifyPhone();

  Future<void> cancel() async {
    _verificationId.value = null;
    _codeSent.value = false;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];
}
