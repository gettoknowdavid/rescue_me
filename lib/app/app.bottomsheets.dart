// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/edit_name/edit_name_sheet.dart';
import '../ui/bottom_sheets/emergency_contact/emergency_contact_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';

enum BottomSheetType {
  emergencyContact,
  imageSource,
  editName,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.emergencyContact: (context, request, completer) =>
        EmergencyContactSheet(request: request, completer: completer),
    BottomSheetType.imageSource: (context, request, completer) =>
        ImageSourceSheet(request: request, completer: completer),
    BottomSheetType.editName: (context, request, completer) =>
        EditNameSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
