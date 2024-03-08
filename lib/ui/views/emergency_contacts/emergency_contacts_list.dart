import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'emergency_contact_tile.dart';
import 'emergency_contacts_viewmodel.dart';

class EmergencyContactsList extends ViewModelWidget<EMCViewModel> {
  const EmergencyContactsList({super.key});

  @override
  Widget build(BuildContext context, EMCViewModel viewModel) {
    if (viewModel.isLoading) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => const EmergencyContactTileSkeleton(),
      );
    }

    if (viewModel.contacts.isEmpty) {
      return const Center(child: Text('Nothing to show here'));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.contacts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, i) => EmergencyContactTile(
        contact: viewModel.contacts[i]!,
      ),
    );
  }
}
