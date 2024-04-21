import 'dart:math';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MapViewModel extends BaseViewModel with OSMMixinObserver, Initialisable {
  final _navigationService = locator<NavigationService>();

  double get latitude => _navigationService.currentArguments.latitude;
  double get longitude => _navigationService.currentArguments.longitude;

  GeoPoint get geoPoint => GeoPoint(latitude: latitude, longitude: longitude);

  late MapController controller;

  final zoomOption = const ZoomOption(
    initZoom: 19,
    minZoomLevel: 3,
    maxZoomLevel: 19,
    stepZoom: 1.0,
  );

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      await controller.addMarker(geoPoint, angle: pi / 3);
    }
  }

  Future<void> onGeoPointClicked(GeoPoint geoPoint) async {
    await controller.zoomToBoundingBox(BoundingBox.fromGeoPoints([geoPoint]));
  }

  @override
  Future<void> initialise() async {
    controller = MapController.withPosition(initPosition: geoPoint);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
