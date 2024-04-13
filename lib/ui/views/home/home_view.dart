import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/user_avatar.dart';
import 'dashboard_items_grid.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${viewModel.firstName}'),
        titleTextStyle: context.appBarTitleStyle,
        centerTitle: false,
        actions: [const UserAvatar(), 16.horizontalSpace],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: const DashboardItemsGrid(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
