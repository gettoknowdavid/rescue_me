import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/emergency_contact.dart';
import 'package:rescue_me/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/avatar.dart';
import 'emergency_contacts_viewmodel.dart';

class EmergencyContactTile extends ViewModelWidget<EMCViewModel> {
  final EmergencyContact contact;
  const EmergencyContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context, EMCViewModel viewModel) {
    final colorScheme = Theme.of(context).colorScheme;

    final isPersonal = contact.type == EmergencyContactType.personal;

    Widget leading = PhosphorIcon(viewModel.getIcon(contact.type), size: 24.r);
    Widget trailing = _PhoneButton(contact: contact);

    if (!isPersonal && contact.imageUrl != null) {
      leading = Avatar(imageUrl: contact.imageUrl);
    }

    if (isPersonal) {
      leading = Avatar(imageUrl: contact.imageUrl);
      trailing = Wrap(
        spacing: 6.r,
        children: [
          _MessageButton(contact: contact),
          _PhoneButton(contact: contact)
        ],
      );
    }

    return Dismissible(
      key: ValueKey(contact),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => viewModel.deleteContact(contact),
      background: Container(
        color: colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16).r,
        child: PhosphorIcon(
          PhosphorIconsDuotone.trash,
          color: colorScheme.onError,
        ),
      ),
      child: ListTile(
        leading: SizedBox(width: 30.r, child: leading),
        contentPadding: EdgeInsets.zero,
        title: Text(
          contact.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: trailing,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        onTap: () => viewModel.goToEditEmergencyContact(contact),
      ),
    );
  }
}

class _MessageButton extends ViewModelWidget<EMCViewModel> {
  final EmergencyContact contact;
  const _MessageButton({required this.contact});

  @override
  Widget build(BuildContext context, EMCViewModel viewModel) {
    return IconButton(
      onPressed: () => viewModel.sendMessage(contact.phone),
      style: IconButton.styleFrom(foregroundColor: Colors.blueAccent),
      icon: const PhosphorIcon(PhosphorIconsDuotone.chatCircleText),
    );
  }
}

class _PhoneButton extends ViewModelWidget<EMCViewModel> {
  final EmergencyContact contact;
  const _PhoneButton({required this.contact});

  @override
  Widget build(BuildContext context, EMCViewModel viewModel) {
    return IconButton(
      onPressed: () => viewModel.call(contact.phone),
      style: IconButton.styleFrom(foregroundColor: Colors.green),
      icon: const PhosphorIcon(PhosphorIconsDuotone.phoneCall),
    );
  }
}

class EmergencyContactTileSkeleton extends StatelessWidget {
  final bool loading;
  const EmergencyContactTileSkeleton({super.key, this.loading = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Skeleton(loading: loading, child: CircleAvatar(radius: 16.r)),
      contentPadding: EdgeInsets.zero,
      title: Skeleton(loading: loading, child: SizedBox(height: 14.r)),
      trailing: Wrap(
        spacing: 6.r,
        children: [
          Skeleton(loading: loading, child: CircleAvatar(radius: 14.r)),
          Skeleton(loading: loading, child: CircleAvatar(radius: 14.r)),
        ],
      ),
    );
  }
}
