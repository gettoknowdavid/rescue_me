import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../dialog_container.dart';
import 'logout_dialog_content_text.dart';
import 'logout_dialog_model.dart';

class LogoutDialog extends StackedView<LogoutDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LogoutDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return DialogContainer(
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                request.title ?? 'Logout?',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.r,
                ),
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: LogoutDialogContentText(request: request),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: viewModel.cancel,
                  child: const Text('Cancel'),
                ),
                20.horizontalSpace,
                PrimaryButton(
                  label: request.mainButtonTitle ?? 'Okay',
                  onPressed: viewModel.logout,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  LogoutDialogModel viewModelBuilder(context) => LogoutDialogModel();
}
