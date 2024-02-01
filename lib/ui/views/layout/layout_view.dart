import 'package:flutter/material.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
      body: ExtendedNavigator(
        navigatorKey: StackedService.nestedNavigationKey(1),
        initialRoute: LayoutViewRoutes.homeView,
        router: LayoutViewRouter(),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LayoutViewModel();
}
