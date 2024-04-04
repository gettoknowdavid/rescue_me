import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/views/sos/sos_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EmergencyContactItem extends ViewModelWidget<SosViewModel> {
  const EmergencyContactItem({super.key, required this.contact});
  final EmergencyContact contact;

  @override
  Widget build(BuildContext context, SosViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => viewModel.call(contact.phone),
      child: SizedBox(
        width: 60.r,
        height: 64.r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 22.r,
              foregroundImage: contact.imageUrl != null
                  ? NetworkImage(contact.imageUrl!)
                  : null,
              child: contact.imageUrl == null
                  ? const Icon(PhosphorIconsBold.phone)
                  : null,
            ),
            Text(
              contact.name,
              style: textTheme.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
