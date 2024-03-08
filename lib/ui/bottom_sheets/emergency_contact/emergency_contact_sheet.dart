import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/bottom_sheets/bottom_sheet_container.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'emergency_contact_sheet_model.dart';

class EmergencyContactSheet extends StackedView<EmergencyContactSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EmergencyContactSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    return BottomSheetContainer(
      child: Wrap(
        children: [
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsDuotone.addressBook),
            title: const Text('Pick from Contacts'),
            onTap: () => completer!(SheetResponse(data: false)),
          ),
          Divider(endIndent: 16.r, indent: 16.r, height: 2.r),
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsDuotone.userPlus),
            title: const Text('Create New Contact'),
            onTap: () => completer!(SheetResponse(data: true)),
          ),
        ],
      ),
    );
  }

  @override
  EmergencyContactSheetModel viewModelBuilder(context) =>
      EmergencyContactSheetModel();
}
