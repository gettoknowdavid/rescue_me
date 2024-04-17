import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'emergency_contact_tile.dart';
import 'emergency_contacts_viewmodel.dart';

class EmergencyContactsList extends ViewModelWidget<EMCViewModel> {
  const EmergencyContactsList({super.key});

  @override
  Widget build(BuildContext context, EMCViewModel viewModel) {
    final isBusy = viewModel.isBusy | !viewModel.dataReady;

    if (isBusy) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => const EmergencyContactTileSkeleton(),
      );
    }

    final contacts = viewModel.data;

    if (!isBusy && contacts != null && contacts.isEmpty) {
      return const Center(child: Text('Nothing to show here'));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contacts!.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, i) => EmergencyContactTile(contact: contacts[i]!),
    );
  }
}
