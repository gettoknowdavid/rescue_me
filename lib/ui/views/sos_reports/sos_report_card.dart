import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/views/sos_reports/sos_reports_viewmodel.dart';
import 'package:rescue_me/ui/widgets/selected_image_widget.dart';
import 'package:stacked/stacked.dart';

class SosReportCard extends ViewModelWidget<SosReportsViewModel> {
  const SosReportCard({super.key, required this.report});
  final EmergencyReport report;

  @override
  Widget build(BuildContext context, SosReportsViewModel viewModel) {
    return ListTile(
      // onTap: () => viewModel.goToSOSView(report),
      title: Text(DateFormat.yMMMMEEEEd().format(report.createdAt)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Port Harcourt'),
          if (report.imageUrls != null && report.imageUrls!.isNotEmpty) ...[
            4.verticalSpace,
            Wrap(
              spacing: 10.r,
              children: report.imageUrls!
                  .map((e) => SelectedImageWidget(url: e))
                  .toList(),
            ),
          ],
          8.verticalSpace,
        ],
      ),
      tileColor: Theme.of(context).colorScheme.surfaceVariant,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: 16.r, cornerSmoothing: 1),
        ),
      ),
      isThreeLine: report.imageUrls?.isNotEmpty == true,
    );
  }
}
