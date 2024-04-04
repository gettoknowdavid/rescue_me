import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SosReportsViewModel extends FutureViewModel {
  final _sosService = locator<SosService>();
  final _navigationService = locator<NavigationService>();

  void goToSOSView(EmergencyReport report) =>
      _navigationService.navigateToSosView(report: report);

  @override
  Future futureToRun() => _sosService.getMySOSReports();
}
