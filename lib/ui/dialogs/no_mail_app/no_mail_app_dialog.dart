import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'no_mail_app_dialog_model.dart';

const double _graphicSize = 60;

class NoMailAppDialog extends StackedView<NoMailAppDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NoMailAppDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoMailAppDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
    );
  }

  @override
  NoMailAppDialogModel viewModelBuilder(BuildContext context) =>
      NoMailAppDialogModel();
}
