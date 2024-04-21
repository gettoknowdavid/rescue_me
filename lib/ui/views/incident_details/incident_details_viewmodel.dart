import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/incident_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IncidentDetailsViewModel extends ReactiveViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _incidentService = locator<IncidentService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  final _currentImageIndex = ReactiveValue<int>(0);

  IncidentDetailsViewModel() {
    listenToReactiveValues([
      _currentImageIndex,
    ]);
  }

  int get currentImageIndex => _currentImageIndex.value;


  late Incident incident;

  void initialize(Incident i) => incident = i;

  User? get user => _authService.user;

  bool get isMe => User.fromJson(incident.creator).uid == user?.uid;

  Future<void> deleteIncident() async {
    final result = await runBusyFuture(
      _incidentService.deleteIncident(incident),
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
      (_) => _navigationService.back(),
    );
  }

  Future<void> viewOnMap({
    required double latitude,
    required double longitude,
  }) {
    return _navigationService.navigateToMapView(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<void> resolveIncident() => _incidentService.resolveIncident(incident);

  Future<void> unResolveIncident() =>
      _incidentService.unResolveIncident(incident);

  void editIncident() =>
      _navigationService.replaceWithAddIncidentView(incident: incident);

  void setPhotoIndex(int index) {
    _currentImageIndex.value = index;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
