import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_list_tile.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sos_sheet_model.dart';

class SosSheet extends StackedView<SosSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SosSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    final colorScheme = Theme.of(context).colorScheme;

    final report = request.data as EmergencyReport;
    final dateFormatter = DateFormat.yMMMMEEEEd();
    final formattedDate = dateFormatter.format(report.createdAt);

    return ColoredBox(
      color: colorScheme.background,
      child: viewModel.isBusy
          ? const LoadingWidget()
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('SOS Report', style: context.firstAidTitle),
                  Text(formattedDate, style: context.subtitleStyle),
                  if (report.description != null) ...[
                    8.verticalSpace,
                    Text(report.description!, style: context.firstAidSubtitle),
                  ],
                  8.verticalSpace,
                  const Divider(),
                  if (report.imageUrls != null) ...[
                    LimitedBox(
                      maxHeight: 200.r,
                      child: ListView.separated(
                        itemCount: report.imageUrls!.length,
                        separatorBuilder: (_, i) => 10.horizontalSpace,
                        itemBuilder: (context, i) => Container(),
                      ),
                    ),
                  ],
                  AppListTile(
                    title: report.creator['name'],
                    subtitle: report.creator['phoneNumber'],
                    icon: PhosphorIconsRegular.userCircle,
                  ),
                  AppListTile(
                    title:
                        '[${report.location.latitude}, ${report.location.longitude}]',
                    subtitle: 'Location Co-ordinates of SOS',
                    icon: PhosphorIconsRegular.batteryFull,
                  ),
                  AppListTile(
                    title: 'Battery Level: ${report.batteryPercentage}%',
                    subtitle: 'Battery level at time of SOS',
                    icon: PhosphorIconsRegular.batteryFull,
                  ),
                  AppListTile(
                    title: 'Status: ${report.status.name.toUpperCase()}',
                    subtitle: 'If the SOS has been resolved or not.',
                    icon: PhosphorIconsRegular.batteryFull,
                  ),
                  16.verticalSpace,
                  // BulletList(title: 'Steps To Administer:', items: firstAid.steps),
                  // 16.verticalSpace,
                  // BulletList(title: 'Avoid These:', items: firstAid.avoid),
                  // 16.verticalSpace,
                  // BulletList(title: 'Signs & Symptoms:', items: firstAid.symptoms),
                  // 16.verticalSpace,
                  // Text('Please note:', style: context.firstAidItemTitle),
                  // 5.verticalSpace,
                  // Text(firstAid.note!, style: context.firstAidSubtitle),
                  // 20.verticalSpace,
                ],
              ),
            ),
    );
  }

  @override
  SosSheetModel viewModelBuilder(BuildContext context) => SosSheetModel();
}
