import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SosActionButton extends StatelessWidget {
  const SosActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.added = false,
  });

  final Widget icon;
  final String label;
  final VoidCallback? onTap;
  final bool added;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final size = Size(62.w, 64.h);

    final backgroundColor = added ? colorScheme.surfaceVariant : null;

    final borderColor =
        added ? colorScheme.primary : colorScheme.primaryContainer;

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        fixedSize: size,
        maximumSize: size,
        minimumSize: size,
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 18.r,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          6.verticalSpace,
          Text(label, style: textTheme.labelSmall),
        ],
      ),
    );
  }
}
