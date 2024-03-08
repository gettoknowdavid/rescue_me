import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  const BottomSheetContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: ShapeDecoration(
        color: colorScheme.background,
        shape: SmoothRectangleBorder(
          side: BorderSide(color: colorScheme.primaryContainer),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 20.r,
            cornerSmoothing: 1,
          ),
        ),
      ),
      margin: const EdgeInsets.all(16).r,
      child: child,
    );
  }
}
