import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'incident_card.dart';
import 'incident_filter_button.dart';
import 'incidents_viewmodel.dart';

class IncidentsView extends StackedView<IncidentsViewModel> {
  const IncidentsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    Widget body = const SizedBox();

    final isBusy = viewModel.isBusy;
    final hasData = viewModel.dataReady && viewModel.data!.isNotEmpty;

    if (isBusy) {
      body = const LoadingWidget(size: WidgetSize.xLarge);
    }

    if (!isBusy && hasData) {
      final incidents = viewModel.data!;
      body = ListView.separated(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) => IncidentCard(incident: incidents[i]!),
        separatorBuilder: (context, i) => 10.verticalSpace,
        itemCount: incidents.length,
      );
    }

    if (!isBusy && !hasData) {
      body = const Center(child: Text('Nothing here'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents Reports', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const IncidentFilterButton(),
              20.verticalSpace,
              body,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.goToAddIncidentView,
        child: const Icon(PhosphorIconsBold.plus),
      ),
    );
  }

  @override
  IncidentsViewModel viewModelBuilder(context) => IncidentsViewModel();
}
