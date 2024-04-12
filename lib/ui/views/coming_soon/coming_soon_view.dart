import 'package:flutter/material.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/coming_soon_widget.dart';
import 'coming_soon_viewmodel.dart';

class ComingSoonView extends StackedView<ComingSoonViewModel> {
  const ComingSoonView({super.key, required this.title});
  final String title;

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: const Center(child: ComingSoonWidget()),
    );
  }

  @override
  ComingSoonViewModel viewModelBuilder(context) => ComingSoonViewModel();
}
