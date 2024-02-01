import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LayoutViewModel viewModel,
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
  LayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LayoutViewModel();
}
