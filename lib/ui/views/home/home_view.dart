import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/user_avatar.dart';
import 'dashboard_items_grid.dart';
import 'home_viewmodel.dart';
import 'search_box.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(fontSize: 16.sp);
    final subheadStyle = textTheme.bodySmall?.copyWith(
      fontSize: 12.r,
      color: colorScheme.onBackground.withOpacity(0.6),
    );
    final headStyle = textTheme.headlineSmall?.copyWith(
      fontSize: 18.r,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello, ${viewModel.firstName}', style: titleStyle),
                const UserAvatar(),
              ],
            ),
            32.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Search for something', style: headStyle),
                Text('Emergency Contacts, Hospitals, etc', style: subheadStyle),
              ],
            ),
            16.verticalSpace,
            const SearchBox(),
            32.verticalSpace,
            const DashboardItemsGrid(),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
