import 'dart:io';

import 'package:intl_phone_field/phone_number.dart';
import 'package:rescue_me/app/app.bottomsheets.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/emergency_contact.dart';
import 'package:rescue_me/services/emergency_contacts_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/ui/views/add_emergency_contact/add_emergency_contact_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

typedef AddEMCViewModel = AddEmergencyContactViewModel;

class AddEmergencyContactViewModel extends FormViewModel
    with ListenableServiceMixin {
  final _bottomSheetService = locator<BottomSheetService>();
  final _emcService = locator<EmergencyContactsService>();
  final _mediaService = locator<MediaService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  final _emcType = ReactiveValue(EmergencyContactType.personal);
  EmergencyContactType get type => _emcType.value;

  final _image = ReactiveValue<File?>(null);
  File? get image => _image.value;

  List<EmergencyContact?> get contacts => _emcService.contacts;

  AddEmergencyContactViewModel() {
    listenToReactiveValues([_emcType, _image]);
  }
  bool get disabled => !isFormValid || !hasName || !hasPhone || isBusy;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _networkService,
        _emcService,
      ];

  NetworkStatus get _networkStatus => _networkService.status;

  void onEMCTypeChanged(EmergencyContactType type) {
    _emcType.value = type;
    setType(_emcType.value.name);
    notifyListeners();
  }

  Future<void> selectImage() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
    );
    if (response?.data == null) return;
    _image.value = File(response!.data.path);
  }

  void setImageFile(File imageFile) => _image.value = imageFile;

  void onPhoneChanged(PhoneNumber phone) {}

  PhoneNumber formatPhone(String completeNumber) {
    return PhoneNumber.fromCompleteNumber(completeNumber: completeNumber);
  }

  String getCountryCode(String? completeNumber) {
    if (completeNumber == null) return 'NG';

    final phone = formatPhone(completeNumber);
    return phone.countryISOCode;
  }

  String? getInitialPhoneValue(String? completeNumber) {
    if (completeNumber == null) return null;

    final phone = formatPhone(completeNumber);
    return phone.number;
  }

  Future<String?> getImageUrl(String fileName, {String? path}) async {
    if (path == null) return null;

    final ref = _mediaService.storageRef.child('images/emc/$fileName');
    await _mediaService.uploadFileToCloud(path, fileName, ref);
    return await _mediaService.getFileFromCloud(ref);
  }

  Future<void> deleteUploadedImage(String fileName) async {
    final fileRef = _mediaService.storageRef.child('images/emc/$fileName');
    await fileRef.delete();
  }

  void removeImage() => _image.value = null;

  void initializeEMCType(EmergencyContactType? t) {
    if (t == null) return;
    _emcType.value = t;
  }

  Future<void> create() async {
    setBusy(true);

    if (_networkStatus == NetworkStatus.disconnected) {
      setBusy(false);
      return;
    }

    final uid = const Uuid().v4();

    final imageUrl = await getImageUrl(uid, path: _image.value?.path);

    final newContact = EmergencyContact(
      uid: uid,
      name: nameValue!,
      phone: phoneValue!,
      type: type,
      email: emailValue,
      isPriority: type != EmergencyContactType.personal,
      imageUrl: imageUrl,
    );

    final result = await _emcService.createEmergencyContact(newContact);

    return result.fold(
      (failure) async {
        await deleteUploadedImage('images/emc/$uid');
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
      (success) => _navigationService.back(result: success),
    );
  }

  Future<void> update(EmergencyContact contact) async {
    setBusy(true);

    if (_networkStatus == NetworkStatus.disconnected) {
      setBusy(false);
      return;
    }

    String? imageUrl;
    if (_image.value != null) {
      imageUrl = await getImageUrl(contact.uid, path: _image.value?.path);
    }

    if (imageUrl == null && contact.imageUrl != null) {
      await deleteUploadedImage(contact.uid);
    }

    final updatedContact = contact.copyWith(
      name: nameValue ?? contact.name,
      email: emailValue ?? contact.email,
      imageUrl: imageUrl,
      phone: phoneValue ?? contact.phone,
      type: type,
    );

    final result = await _emcService.updateEmergencyContact(updatedContact);

    return result.fold(
      (failure) async {
        await deleteUploadedImage('images/emc/${contact.uid}');
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
      (success) => _navigationService.back(result: success),
    );
  }
}
