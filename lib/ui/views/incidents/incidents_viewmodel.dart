import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/models/incident_filter.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/incident_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IncidentsViewModel extends StreamViewModel<List<Incident?>>
    with ListenableServiceMixin {
  IncidentsViewModel() {
    listenToReactiveValues([_filter]);
  }

  final _filter = ReactiveValue(IncidentFilter.latest);
  IncidentFilter get filter => _filter.value;

  void setFilter(Set<IncidentFilter> filterSet) {
    _filter.value = filterSet.single;
    notifyListeners();
    notifySourceChanged();
  }

  final _authService = locator<AuthService>();
  final _incidentsService = locator<IncidentService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  User? get user => _authService.user;

  bool isMe(String userId) => userId == user!.uid;

  void goToAddIncidentView() => _navigationService.navigateToAddIncidentView();

  void goToAddIncidentDetails(Incident incident) =>
      _navigationService.navigateToIncidentDetailsView(incident: incident);

  Future<void> deleteIncident(Incident incident) async {
    final result = await runBusyFuture(
      _incidentsService.deleteIncident(incident),
    );

    return result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => keServer,
            error: (value) => value.message ?? 'Some funny kind of error',
            timeOut: (_) => keTimeout,
          ),
        );
      },
      (success) => setBusy(false),
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  @override
  Stream<List<Incident?>> get stream => _incidentsService.getIncidents(filter);
}
