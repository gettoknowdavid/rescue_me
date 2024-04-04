import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/views/sos/emergency_contact_item.dart';
import 'package:rescue_me/ui/views/sos/sos_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CallField extends ViewModelWidget<SosViewModel> {
  const CallField({super.key});

  @override
  Widget build(BuildContext context, SosViewModel viewModel) {
    if (viewModel.emergencyContacts.isEmpty) return const SizedBox();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Call', style: context.fieldLabel),
        const Divider(),
        4.verticalSpace,
        LimitedBox(
          maxHeight: 64.r,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) => EmergencyContactItem(
              contact: viewModel.emergencyContacts[i]!,
            ),
            separatorBuilder: (context, i) => const SizedBox(width: 6),
            itemCount: viewModel.emergencyContacts.length,
          ),
        ),
      ],
    );
  }
}
