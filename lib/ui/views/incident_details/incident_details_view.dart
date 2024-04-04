import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'creator_section.dart';
import 'incident_detail_item.dart';
import 'incident_details_actions.dart';
import 'incident_details_header.dart';
import 'incident_details_viewmodel.dart';

final _smoothBorderRadius = SmoothBorderRadius.all(
  SmoothRadius(
    cornerRadius: 16.r,
    cornerSmoothing: 1,
  ),
);

class IncidentDetailsView extends StackedView<IncidentDetailsViewModel> {
  const IncidentDetailsView({super.key, required this.incident});
  final Incident incident;

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final scrollController = ScrollController();

    if (viewModel.isBusy) {
      return const Scaffold(
        body: LoadingWidget(size: WidgetSize.xLarge),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            leadingWidth: 70.w,
            expandedHeight: 0.32.sh,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: const IncidentDetailsHeader(),
            leading: const Center(child: AppBackButton()),
            iconTheme: theme.iconTheme.copyWith(color: Colors.white),
            actionsIconTheme: theme.iconTheme.copyWith(color: Colors.white),
          ),
        ],
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.all(16).r,
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!viewModel.isMe && !incident.anonymous)
                const CreatorSection()
              else
                const IncidentDetailsActions(),
              24.verticalSpace,
              Text(
                incident.title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (incident.description != null) ...[
                4.verticalSpace,
                Text(
                  incident.description!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.7),
                  ),
                ),
              ],
              16.verticalSpace,
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12).r,
                decoration: BoxDecoration(
                  color: incident.severity.color.withOpacity(0.4),
                  borderRadius: _smoothBorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: IncidentDetailItem(
                        icon: PhosphorIconsRegular.warning,
                        label: 'Type',
                        title: incident.type.name,
                      ),
                    ),
                    Expanded(
                      child: IncidentDetailItem(
                        icon: PhosphorIconsRegular.warningDiamond,
                        label: 'Level',
                        title: incident.severity.name,
                        iconColor: incident.severity.color,
                        onIconColor: incident.severity.onColor,
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              IncidentDetailItem(
                icon: PhosphorIconsRegular.calendar,
                label: 'Date of Incident',
                title: DateFormat('dd/MM/yyyy').format(incident.createdAt),
              ),
              16.verticalSpace,
              IncidentDetailItem(
                icon: PhosphorIconsRegular.mapPin,
                label: 'Location',
                title: incident.address,
              ),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  IncidentDetailsViewModel viewModelBuilder(context) =>
      IncidentDetailsViewModel();
}
