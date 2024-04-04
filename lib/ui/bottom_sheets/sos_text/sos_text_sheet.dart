import 'package:flutter/material.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../bottom_sheet_container.dart';
import 'sos_text_sheet_model.dart';

class SosTextSheet extends StackedView<SosTextSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const SosTextSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    return const BottomSheetContainer(
      child: AppTextFormField(
        label: 'Emergency Description',
        hint: 'What is the emergency about?',
      ),
    );
  }

  @override
  SosTextSheetModel viewModelBuilder(context) => SosTextSheetModel();
}
