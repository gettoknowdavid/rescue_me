import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.bottomsheets.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/core/errors/auth_error.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_bio_view.form.dart';

class EditBioViewModel extends FormViewModel with ListenableServiceMixin {
  EditBioViewModel() {
    listenToReactiveValues([_image, _imageUrl]);

    _imageUrl.value = _authService.user?.photoURL;
  }

  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarService = locator<SnackbarService>();

  User get user => _authService.user!;

  bool get hasNewValue =>
      nameValue != user.displayName ||
      _image.value != null ||
      _imageUrl.value != user.photoURL;
  bool get isButtonDisabled => !hasNewValue || isBusy;

  final _image = ReactiveValue<File?>(null);
  File? get image => _image.value;

  final _imageUrl = ReactiveValue<String?>(null);
  String? get imageUrl => _imageUrl.value;

  bool get hasNewImage => _image.value != null;

  Future<void> selectAvatar() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
    );
    if (response?.data == null) return;
    _image.value = File(response!.data.path);
    notifyListeners();
  }

  Future<void> deleteUploadedImage(String fileName) async {
    final fileRef = _mediaService.storageRef.child('images/profiles/$fileName');
    await fileRef.delete();
  }

  Future<void> removeAvatar() async {
    _imageUrl.value = null;
    notifyListeners();
  }

  Future<String?> getUploadedUrl() async {
    if (_image.value == null) return null;

    final userId = user.uid;
    final ref = _mediaService.storageRef.child('images/profiles/$userId');
    await _mediaService.uploadFileToCloud(_image.value!.path, userId, ref);
    return await _mediaService.getFileFromCloud(ref);
  }

  Future<void> save() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return;
    }

    setBusy(true);
    final currentName = _authService.user?.displayName;
    final hasNewName = currentName != nameValue;

    late Either<AuthError, Unit> result;

    if (hasNewName) {
      result = await _authService.changeName(nameValue!);
    }

    if (_image.value != null) {
      final photoURL = await getUploadedUrl();
      result = await _authService.changeAvatar(photoURL);
    }

    if (_imageUrl.value == null) {
      result = await _authService.removeAvatar();
    }

    return result.fold(
      (failure) async {
        await deleteUploadedImage(user.uid);
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
        if (_imageUrl.value == null) {
          deleteUploadedImage(user.uid);
        }

        _image.value = null;
        notifyListeners();
        _authService.reload();
        _navigationService.back();
      },
    );
  }

  void cancelAvatarChange() {
    _image.value = null;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];
}
