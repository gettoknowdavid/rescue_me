import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;
  const DialogContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: SmoothRectangleBorder(
        side: BorderSide(color: colorScheme.primaryContainer),
        borderRadius: SmoothBorderRadius(
          cornerRadius: 20.r,
          cornerSmoothing: 1,
        ),
      ),
      child: child,
    );
  }
}
