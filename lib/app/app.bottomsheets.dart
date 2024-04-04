// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/emergency_contact/emergency_contact_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import '../ui/bottom_sheets/sos_photos/sos_photos_sheet.dart';
import '../ui/bottom_sheets/sos_text/sos_text_sheet.dart';

enum BottomSheetType {
  emergencyContact,
  imageSource,
  sosPhotos,
  sosText,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.emergencyContact: (context, request, completer) =>
        EmergencyContactSheet(request: request, completer: completer),
    BottomSheetType.imageSource: (context, request, completer) =>
        ImageSourceSheet(request: request, completer: completer),
    BottomSheetType.sosPhotos: (context, request, completer) =>
        SosPhotosSheet(request: request, completer: completer),
    BottomSheetType.sosText: (context, request, completer) =>
        SosTextSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
