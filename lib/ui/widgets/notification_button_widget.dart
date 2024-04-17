import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';

final _smoothBorderRadius = SmoothBorderRadius(
  cornerRadius: 16.r,
  cornerSmoothing: 1,
);

class NotificationButtonWidget extends StatelessWidget {
  const NotificationButtonWidget({
    super.key,
    required this.onTap,
    this.title,
    this.subtitle,
    this.showIcon = true,
  });

  final VoidCallback onTap;
  final String? title, subtitle;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final color =
        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4);

    return InkWell(
      onTap: onTap,
      borderRadius: _smoothBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: _smoothBorderRadius,
        ),
        padding: const EdgeInsets.all(16).r,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(title ?? 'Notifications', style: context.titleStyle),
                  Text(
                    subtitle ?? 'You have no new notifications',
                    style: context.subtitleStyle,
                  ),
                ],
              ),
            ),
            if (showIcon) Icon(PhosphorIconsRegular.caretRight, size: 16.r),
          ],
        ),
      ),
    );
  }
}
