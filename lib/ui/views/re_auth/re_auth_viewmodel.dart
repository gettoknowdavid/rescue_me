import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 're_auth_view.form.dart';

class ReAuthViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();

  bool get disabled => isBusy || !isFormValid || !hasPassword;

  Future<void> next() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }

    final password = passwordValue;

    if (password != null) {
      final result = await runBusyFuture(_authService.reauthenticate(password));

      return result.fold(
        (failure) => _navigationService.back(result: failure),
        (success) => _navigationService.replaceWithEditEmailView(),
      );
    }
  }
}
