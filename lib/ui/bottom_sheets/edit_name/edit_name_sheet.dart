import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_name_sheet_model.dart';

class EditNameSheet extends StackedView<EditNameSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditNameSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    return Container();
  }

  @override
  EditNameSheetModel viewModelBuilder(context) => EditNameSheetModel();
}
