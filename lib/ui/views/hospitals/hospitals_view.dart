import 'package:flutter/material.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/coming_soon_widget.dart';
import 'hospitals_viewmodel.dart';

class HospitalsView extends StackedView<HospitalsViewModel> {
  const HospitalsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hospitals'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: const Center(child: ComingSoonWidget()),
    );
  }

  @override
  HospitalsViewModel viewModelBuilder(context) => HospitalsViewModel();
}
