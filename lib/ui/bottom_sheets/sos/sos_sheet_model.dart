import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SosSheetModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> viewOnMap({
    required double latitude,
    required double longitude,
  }) {
    return _navigationService.navigateToMapView(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
