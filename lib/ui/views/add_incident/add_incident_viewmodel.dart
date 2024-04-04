import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/emergency_status.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/incident_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/ui/views/add_incident/add_incident_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class AddIncidentViewModel extends FormViewModel with ListenableServiceMixin {
  final _currentIndex = ReactiveValue<int>(0);
  final _editing = ReactiveValue<bool>(false);
  final _images = ReactiveValue<List<File?>>([]);
  final _photoUrls = ReactiveValue<List<String?>>([]);
  final _incidentType = ReactiveValue(IncidentType.other);
  final _incidentSeverity = ReactiveValue(IncidentSeverity.low);
  final _anonymous = ReactiveValue<bool>(false);
  final _location = ReactiveValue<GeoPoint?>(null);

  int get currentIndex => _currentIndex.value;
  bool get editing => _editing.value;
  List<File?> get images => _images.value;
  List<String?> get photoUrls => _photoUrls.value;
  IncidentType get type => _incidentType.value;
  IncidentSeverity get severity => _incidentSeverity.value;
  bool get anonymous => _anonymous.value;
  GeoPoint? get location => _location.value;

  AddIncidentViewModel() {
    listenToReactiveValues([
      _currentIndex,
      _editing,
      _images,
      _photoUrls,
      _incidentType,
      _incidentSeverity,
      _anonymous,
    ]);
  }

  final _authService = locator<AuthService>();
  final _incidentService = locator<IncidentService>();
  final _mediaService = locator<MediaService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  Incident? get incident => _navigationService.currentArguments?.incident;

  NetworkStatus get _networkStatus => _networkService.status;
  User? get user => _authService.user;

  bool get disabled =>
      isBusy ||
      !isFormValid ||
      !hasTitle ||
      !hasAddress ||
      !hasType ||
      !hasSeverity ||
      !hasChanges;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  bool get hasChanges =>
      titleValue != incident?.title ||
      addressValue != incident?.address ||
      descriptionValue != incident?.description ||
      _photoUrls.value != incident?.photoUrls ||
      _incidentType.value != incident?.type ||
      _incidentSeverity.value != incident?.severity ||
      _anonymous.value != incident?.anonymous;

  void setPhotoIndex(int index) {
    _currentIndex.value = index;
    notifyListeners();
  }

  void setPhotoURLs(List<String?> list) {
    _photoUrls.value = list;
    notifyListeners();
  }

  Future<void> getImages() async {
    final files = await _mediaService.getMultiImages();

    if (files != null || files?.isNotEmpty == true) {
      _images.value = files!.map((e) => File(e.path)).toList();
    }

    notifyListeners();
  }

  void setAnonymous(bool value) {
    _anonymous.value = value;
    notifyListeners();
  }

  void onIncidentTypeChanged(IncidentType type) {
    _incidentType.value = type;
    setType(_incidentType.value.name);
    notifyListeners();
  }

  void onIncidentSeverityChanged(IncidentSeverity severity) {
    _incidentSeverity.value = severity;
    setSeverity(_incidentSeverity.value.name);
    notifyListeners();
  }

  void removeImage(File imageFile) {
    _images.value.remove(imageFile);
    notifyListeners();
  }

  Future<void> create() async {
    setBusy(true);

    if (_networkStatus == NetworkStatus.disconnected) {
      setBusy(false);
      return;
    } else {
      final uid = incident != null ? incident!.uid : const Uuid().v4();

      if (_images.value.isNotEmpty) {
        for (var i = 0; i < _images.value.length; i++) {
          final fileName = '$uid+$i.jpg';

          final ref = _mediaService.storageRef.child(
            'images/incidents/$uid/$fileName',
          );

          await _mediaService.upload(_images.value[i]!.path, fileName, ref);

          final url = await _mediaService.getFileFromCloud(ref);
          _photoUrls.value.add(url);
        }
      }

      final newIncident = Incident(
        uid: uid,
        title: titleValue!,
        address: addressValue!,
        description: descriptionValue,
        creator: user!.toJson(),
        anonymous: _anonymous.value,
        createdAt: DateTime.now(),
        photoUrls: _photoUrls.value.isEmpty ? [] : _photoUrls.value,
        location: _location.value ?? const GeoPoint(0, 0),
        type: _incidentType.value,
        severity: _incidentSeverity.value,
        status: EmergencyStatus.pending,
      );

      final result = await _incidentService.createIncident(newIncident);

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
        (success) {
          setBusy(false);
          _navigationService.back();
        },
      );
    }
  }
}
