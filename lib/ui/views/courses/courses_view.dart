import 'package:flutter/material.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/coming_soon_widget.dart';
import 'courses_viewmodel.dart';

class CoursesView extends StackedView<CoursesViewModel> {
  const CoursesView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Courses'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: const Center(child: ComingSoonWidget()),
    );
  }

  @override
  CoursesViewModel viewModelBuilder(context) => CoursesViewModel();
}
