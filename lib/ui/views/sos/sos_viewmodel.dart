import 'dart:io';

import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/emergency_contacts_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SosViewModel extends ReactiveViewModel with ListenableServiceMixin {
  SosViewModel() {
    listenToReactiveValues([_description, _images, _imageUrls]);
  }

  final _emergencyContactsService = locator<EmergencyContactsService>();
  final _mediaService = locator<MediaService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _sosService = locator<SosService>();
  final _snackbarService = locator<SnackbarService>();

  final _images = ReactiveValue<List<File?>>([]);
  List<File?> get images => _images.value;

  final _description = ReactiveValue<String?>(null);
  String? get description => _description.value;

  final _imageUrls = ReactiveValue<List<String?>>([]);
  List<String?> get imageUrls => _imageUrls.value;

  bool get hasImages => _images.value.isNotEmpty == true;

  List<EmergencyContact?> get emergencyContacts =>
      _emergencyContactsService.contacts;

  Future<void> call(String phoneNumber) async {
    final url = Uri.parse('tel:+$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _snackBarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: 'An error occurred. Please try again.',
      );
    }
  }

  void getImages() async {
    final files = await _mediaService.getMultiImages();

    if (files != null) {
      final limitedFiles = files.take(3).toList();
      _images.value = limitedFiles.map((e) => File(e.path)).toList();
    } else {
      _images.value = [];
    }
    notifyListeners();
  }

  void removeImage(File imageFile) {
    _images.value.remove(imageFile);
    notifyListeners();
  }

  Future<void> resolve(EmergencyReport report) async {
    final result = await runBusyFuture(_sosService.closeEmergency(report));

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
      (success) => _navigationService.popRepeated(2),
    );
  }

  Future<void> uploadPhotos() async {
    setBusy(true);
    final EmergencyReport report = _navigationService.currentArguments.report;
    final uid = report.uid;

    if (_images.value.isNotEmpty) {
      for (var i = 0; i < _images.value.length; i++) {
        final ref = _mediaService.storageRef.child('images/reports/$uid/$i');
        await _mediaService.upload(_images.value[i]!.path, '$i', ref);
        final url = await _mediaService.getFileFromCloud(ref);
        _imageUrls.value.add(url);
      }

      await _sosService.updateEmergency(report.copyWith(imageUrls: imageUrls));
    }
    setBusy(false);
  }

  void onDescriptionChanged(String? value) {
    _description.value = value;
    notifyListeners();
  }

  Future<void> addDescription() async {
    setBusy(true);
    final EmergencyReport report = _navigationService.currentArguments.report;
    await _sosService.updateEmergency(
      report.copyWith(description: _description.value),
    );
    setBusy(false);
  }

  void initialize(EmergencyReport report) {
    _imageUrls.value = report.imageUrls ?? [];
    _description.value = report.description;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _emergencyContactsService,
      ];
}
