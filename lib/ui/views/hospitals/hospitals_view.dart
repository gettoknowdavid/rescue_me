import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'hospitals_viewmodel.dart';

class HospitalsView extends StackedView<HospitalsViewModel> {
  const HospitalsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HospitalsViewModel viewModel,
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
  HospitalsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HospitalsViewModel();
}
