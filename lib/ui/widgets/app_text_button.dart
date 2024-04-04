import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: colorScheme.surfaceVariant,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 8.r,
              cornerSmoothing: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6).r,
        child: Text(label, style: textTheme.labelSmall),
      ),
    );
  }
}
