import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final borderRadiusAll12 = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.r)),
);

extension AppTextStylesX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextStyle? get titleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get appBarTitleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get subtitleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 11.sp,
        color: theme.colorScheme.onBackground.withOpacity(0.5),
      );
}
