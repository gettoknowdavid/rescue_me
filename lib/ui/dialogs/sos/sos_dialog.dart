import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../dialog_container.dart';
import 'sos_dialog_model.dart';

class SosDialog extends StackedView<SosDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SosDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return DialogContainer(
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(PhosphorIconsDuotone.asterisk, size: 60.r),
            Text(
              'SOS Emergency',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            8.verticalSpace,
            Text(
              'Are you experiencing an emergency?',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: viewModel.cancel,
                    child: const Text('Cancel'),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: PrimaryButton(
                    disabled: viewModel.isBusy,
                    loading: viewModel.isBusy,
                    onPressed: viewModel.sendHelp,
                    label: 'Send Help',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  SosDialogModel viewModelBuilder(context) => SosDialogModel();
}
