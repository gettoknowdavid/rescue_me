import 'dart:io';

import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SosPhotosSheetModel extends BaseViewModel with ListenableServiceMixin {
  SosPhotosSheetModel() {
    listenToReactiveValues([_images]);
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();

  final _images = ReactiveValue<List<File?>>([]);
  List<File?> get images => _images.value;

  bool get hasImages => _images.value.isNotEmpty == true;

  void getImages() async {
    final files = await _mediaService.getMultiImages();

    if (files != null) {
      final limitedFiles = files.take(4).toList();
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

  @override
  void dispose() {
    if (hasImages) {
      _bottomSheetService.completeSheet(SheetResponse(data: _images.value));
    }
    super.dispose();
  }

  void initialize(List<File?> imageFiles) {
    _images.value = imageFiles;
    notifyListeners();
  }
}
