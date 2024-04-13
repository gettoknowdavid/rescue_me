import 'package:battery_plus/battery_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/location_service.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../models/emergency_status.dart';

class SosDialogModel extends ReactiveViewModel with ListenableServiceMixin {
  SosDialogModel() {
    listenToReactiveValues([_selectedTypes]);
    _locationService.determinePosition();
  }

  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _sosService = locator<SosService>();
  final _locationService = locator<LocationService>();

  final _selectedTypes = ReactiveValue<Map<EmergencyContactType, bool>>({
    EmergencyContactType.ambulance: true,
    EmergencyContactType.fire: false,
    EmergencyContactType.police: false
  });
  Map<EmergencyContactType, bool> get selectedTypes => _selectedTypes.value;

  User get user => _authService.user!;
  GeoPoint? get geo => _locationService.geo;

  void onSelectType(bool? value, EmergencyContactType type) {
    _selectedTypes.value[type] = value!;
    notifyListeners();
  }

  void cancel() => _navigationService.popRepeated(1);

  Future<void> sendHelp() async {
    final emergencyTypes = _selectedTypes.value.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    final battery = Battery();
    final batteryPercentage = await battery.batteryLevel;

    final report = EmergencyReport(
      uid: const Uuid().v4(),
      creator: user.toJson(),
      status: EmergencyStatus.pending,
      emergencyTypes: emergencyTypes,
      createdAt: DateTime.now(),
      location: geo!,
      batteryPercentage: batteryPercentage,
    );

    final result = await runBusyFuture(_sosService.createEmergency(report));

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
      (_) => _navigationService.navigateToSosView(report: report),
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _locationService,
      ];
}
