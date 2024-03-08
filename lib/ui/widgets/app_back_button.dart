import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        height: 36.r,
        width: 36.r,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10.r,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.maybePop(context),
          child: const BackButtonIcon(),
        ),
      ),
    );
  }
}
