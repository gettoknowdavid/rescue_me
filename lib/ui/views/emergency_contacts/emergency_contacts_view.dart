import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'emergency_contacts_viewmodel.dart';

class EmergencyContactsView extends StackedView<EmergencyContactsViewModel> {
  const EmergencyContactsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EmergencyContactsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  EmergencyContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmergencyContactsViewModel();
}
