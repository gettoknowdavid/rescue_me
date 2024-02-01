import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'mail_app_dialog_model.dart';

class MailAppDialog extends StackedView<MailAppDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MailAppDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MailAppDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
    );
  }

  @override
  MailAppDialogModel viewModelBuilder(BuildContext context) =>
      MailAppDialogModel();
}
