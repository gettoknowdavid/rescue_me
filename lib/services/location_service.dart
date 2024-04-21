import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:rescue_me/core/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  LocationService() {
    listenToReactiveValues([_geo]);
    determinePosition();
  }

  final _geo = ReactiveValue<GeoPoint?>(null);
  GeoPoint? get geo => _geo.value;

  final _position = ReactiveValue<Position?>(null);
  Position? get position => _position.value;

  Future<void> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(kLocationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(kLocationPermissionPermanentlyDenied);
    }

    final result = await Geolocator.getCurrentPosition();

    _geo.value = GeoPoint(result.latitude, result.longitude);

    _position.value = result;
    Logger().w('Location Gotten => ${_geo.value}');

    notifyListeners();
  }

  Future<Placemark> getLocationDetails(GeoPoint geoPoint) async {
    final placemarks = await placemarkFromCoordinates(
      geoPoint.latitude,
      geoPoint.longitude,
    );
    return placemarks[0];
  }
}
