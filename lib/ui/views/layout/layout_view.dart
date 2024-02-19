import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:rescue_me/ui/widgets/help_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: ExtendedNavigator(
        navigatorKey: StackedService.nestedNavigationKey(1),
        initialRoute: LayoutViewRoutes.homeView,
        router: LayoutViewRouter(),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.viewInsetsOf(context).bottom == 0.0,
        child: HelpButton(onTap: () {}, radius: 40.r),
      ),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
