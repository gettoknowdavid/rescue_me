import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/dashboard_item.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

final _smoothRectangleBorder = SmoothRectangleBorder(
  borderRadius: SmoothBorderRadius(
    cornerRadius: 16.r,
    cornerSmoothing: 1,
  ),
);

class DashboardItemWidget extends ViewModelWidget<HomeViewModel> {
  const DashboardItemWidget({super.key, required this.item});

  final DashboardItem item;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final textStyle = textTheme.titleSmall?.copyWith(
      fontSize: 12.r,
      color: item.color,
    );

    final screenWidth = 1.sw;
    final containerHeight = screenWidth / 2;

    return InkWell(
      onTap: () => viewModel.goToDashboardItem(item.route),
      customBorder: _smoothRectangleBorder,
      child: Container(
        height: containerHeight,
        width: containerHeight,
        padding: const EdgeInsets.all(16).r,
        decoration: ShapeDecoration(
          color: item.color.withOpacity(0.15),
          shape: _smoothRectangleBorder,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: containerHeight * 0.32,
              width: containerHeight * 0.32,
              child: PhosphorIcon(
                item.icon,
                size: 48.r,
                color: item.color,
                duotoneSecondaryColor: item.secondaryColor,
                duotoneSecondaryOpacity: 0.1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: Text(
                item.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
