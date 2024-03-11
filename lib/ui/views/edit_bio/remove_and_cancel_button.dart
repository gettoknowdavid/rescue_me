import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/views/edit_bio/edit_bio_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RemoveAndCancelButton extends ViewModelWidget<EditBioViewModel> {
  const RemoveAndCancelButton({super.key});

  @override
  Widget build(BuildContext context, EditBioViewModel viewModel) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: viewModel.hasNewImage ? null : viewModel.removeAvatar,
          style: TextButton.styleFrom(foregroundColor: colorScheme.onSurface),
          child: const Text('Remove Photo'),
        ),
        if (viewModel.hasNewImage) ...[
          16.horizontalSpace,
          TextButton(
            onPressed: viewModel.cancelAvatarChange,
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: const Text('Cancel'),
          ),
        ]
      ],
    );
  }
}
