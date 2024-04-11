import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'first_aid_viewmodel.dart';

class FirstAidView extends StackedView<FirstAidViewModel> {
  const FirstAidView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return const Scaffold();
  }

  @override
  FirstAidViewModel viewModelBuilder(context) => FirstAidViewModel();
}
