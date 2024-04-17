import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_list_tile.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/notification_button_widget.dart';
import 'notifications_viewmodel.dart';

class NotificationsView extends StackedView<NotificationsViewModel> {
  const NotificationsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16).r,
            child: const Column(
              children: [
                NotificationsList(),
              ],
            ),
          ),
          if (viewModel.isSOSLoading)
            const LoadingWidget(size: WidgetSize.xLarge),
        ],
      ),
    );
  }

  @override
  NotificationsViewModel viewModelBuilder(context) => NotificationsViewModel();
}

class NotificationsList extends ViewModelWidget<NotificationsViewModel> {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context, NotificationsViewModel viewModel) {
    final isBusy = viewModel.isBusy;
    final hasData = viewModel.dataReady && viewModel.data!.isNotEmpty;

    if (isBusy) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => const AppListTileSkeleton(),
      );
    }

    if (!isBusy && !hasData) {
      return const Center(child: Text('Nothing to show here'));
    }

    final notifications = viewModel.data!;

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index]!;
        return NotificationButtonWidget(
          title: notification.title,
          subtitle: 'From: ${notification.recipientName}',
          showIcon: false,
          onTap: () => viewModel.showSOSBottomSheet(
            sosId: notification.sosId,
            userId: notification.recipientId,
          ),
        );
      },
    );
  }
}
