import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:rescue_me/ui/widgets/notification_button_widget.dart';
import 'package:stacked/stacked.dart';

import 'sos_reports_viewmodel.dart';

class SosReportsView extends StackedView<SosReportsViewModel> {
  const SosReportsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    Widget body = const SizedBox();

    final isBusy = viewModel.isBusy;
    final hasData = viewModel.dataReady && viewModel.data!.isNotEmpty;

    if (isBusy) {
      body = const LoadingWidget(size: WidgetSize.xLarge);
    }

    if (!isBusy && hasData) {
      final reports = viewModel.data!;
      body = ListView.separated(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) => NotificationButtonWidget(
          onTap: () => viewModel.showSOSBottomSheet(reports[i]),
          title: DateFormat.yMMMMEEEEd().format(reports[i].createdAt),
          subtitle:
              'Time: ${TimeOfDay.fromDateTime(reports[i].createdAt).format(context)}',
        ),
        separatorBuilder: (context, i) => 16.verticalSpace,
        itemCount: reports.length,
      );
    }

    if (!isBusy && !hasData) {
      body = const Center(child: Text('Nothing here'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Reports', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.verticalSpace,
              body,
            ],
          ),
        ),
      ),
    );
  }

  @override
  SosReportsViewModel viewModelBuilder(context) => SosReportsViewModel();
}
