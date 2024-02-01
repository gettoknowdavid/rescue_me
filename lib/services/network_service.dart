import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkService with ListenableServiceMixin {
  final _snackbarService = locator<SnackbarService>();

  final _status = ReactiveValue<NetworkStatus>(NetworkStatus.connected);
  NetworkStatus get status => _status.value;

  NetworkService() {
    listenToReactiveValues([_status]);
    _listenForChange();
  }

  StreamSubscription<InternetConnectionStatus> _listenForChange() {
    return InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (_status.value != NetworkStatus.connected) {
            _status.value = NetworkStatus.connected;
            _snackbarService.closeSnackbar();
            _snackbarService.showCustomSnackBar(
              message: 'Back online.',
              variant: SnackbarType.networkOnline,
              duration: const Duration(seconds: 6),
            );
          }
          break;

        default:
          _status.value = NetworkStatus.disconnected;
          _snackbarService.showCustomSnackBar(
            message: 'You are offline.',
            variant: SnackbarType.networkOffline,
            duration: const Duration(days: 1000),
          );
          break;
      }
    });
  }
}

enum NetworkStatus { connected, disconnected }
