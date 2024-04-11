import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingWidget(size: WidgetSize.xxLarge),
            Text(
              'Initializing',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(context) => StartupViewModel();

  @override
  void onViewModelReady(viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
