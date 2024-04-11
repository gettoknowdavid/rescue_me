import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final borderRadiusAll12 = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.r)),
);

extension AppTextStylesX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextStyle? get headline => theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      );

  TextStyle? get titleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      );


  TextStyle? get firstAidItemTitle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get firstAidTitle => theme.textTheme.headlineLarge?.copyWith(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get firstAidSubtitle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 12.sp,
        color: theme.colorScheme.onBackground.withOpacity(0.6),
      );

  TextStyle? get profileNameStyle => theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.r,
      );

  TextStyle? get appBarTitleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get subtitleStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 11.sp,
        color: theme.colorScheme.onBackground.withOpacity(0.5),
      );

  TextStyle? get fieldErrorStyle => theme.textTheme.bodyMedium?.copyWith(
        fontSize: 11.sp,
        color: theme.colorScheme.error,
      );

  TextStyle? get fieldLabel => theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onBackground.withOpacity(0.8),
      );

  TextStyle? get fieldLabelFocused => theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      );

  TextStyle? get confirmationBodyStyle => theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onBackground.withOpacity(0.6),
      );
}
