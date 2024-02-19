import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'first_aid_viewmodel.dart';

class FirstAidView extends StackedView<FirstAidViewModel> {
  const FirstAidView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FirstAidViewModel viewModel,
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
  FirstAidViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FirstAidViewModel();
}
