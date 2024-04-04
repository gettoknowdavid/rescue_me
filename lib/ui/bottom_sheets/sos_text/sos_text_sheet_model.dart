import 'dart:io';

import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:stacked/stacked.dart';

class SosTextSheetModel extends BaseViewModel with ListenableServiceMixin {
  SosTextSheetModel() {
    listenToReactiveValues([_file]);
  }

  final _mediaService = locator<MediaService>();

  final _file = ReactiveValue<File?>(null);
  File? get file => _file.value;

  Future<File?> imageChanged(bool fromGallery) async {
    final file = await _mediaService.getImage(fromGallery: fromGallery);
    if (file != null) {
      _file.value = File(file.path);
      return _file.value;
    } else {
      return null;
    }
  }
}
