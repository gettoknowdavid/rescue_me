import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/views/sos/sos_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DescriptionField extends ViewModelWidget<SosViewModel> {
  const DescriptionField({super.key, required this.report});

  final EmergencyReport report;

  @override
  Widget build(BuildContext context, SosViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        Text('Description', style: context.fieldLabel),
        const Divider(),
        4.verticalSpace,
        TextFormField(
          maxLines: 3,
          maxLength: 244,
          onChanged: viewModel.onDescriptionChanged,
          initialValue: report.description,
          decoration: InputDecoration(
            hintText: 'What is the emergency about?',
            contentPadding: const EdgeInsets.all(12).r,
            counter: const Offstage(),
          ),
        ),
      ],
    );
  }
}
