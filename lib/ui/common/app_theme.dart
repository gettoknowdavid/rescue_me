import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => FlexThemeData.light(
        scheme: FlexScheme.red,
        usedColors: 1,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 2,
        // lightIsWhite: true,
        appBarElevation: 0.0,
        subThemesData: FlexSubThemesData(
          appBarCenterTitle: true,
          appBarBackgroundSchemeColor: SchemeColor.background,
          appBarScrolledUnderElevation: 0.0,
          buttonPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ).r,
          blendOnLevel: 10,
          blendOnColors: false,
          blendTextTheme: true,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          thinBorderWidth: 1.0.r,
          thickBorderWidth: 2.0.r,
          defaultRadius: 12.0.r,
          outlinedButtonSchemeColor: SchemeColor.onBackground,
          outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
          outlinedButtonPressedBorderWidth: 2.0.r,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          sliderValueTinted: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          popupMenuRadius: 6.0.r,
          popupMenuElevation: 8.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 6.0.r,
          menuElevation: 8.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
          bottomNavigationBarSelectedLabelSize: 10,
          bottomNavigationBarUnselectedLabelSize: 10,
          bottomNavigationBarElevation: 0.0,
          bottomSheetRadius: 24.r,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  static ThemeData get dark => FlexThemeData.dark(
        scheme: FlexScheme.red,
        usedColors: 1,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 12,
        // darkIsTrueBlack: true,
        appBarElevation: 0.0,
        appBarBackground: Colors.transparent,
        subThemesData: FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.background,
          appBarCenterTitle: true,
          appBarScrolledUnderElevation: 0.0,
          buttonPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ).r,
          blendOnLevel: 8,
          blendTextTheme: true,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          defaultRadius: 12.0.r,
          thinBorderWidth: 1.0.r,
          thickBorderWidth: 2.0.r,
          outlinedButtonSchemeColor: SchemeColor.onBackground,
          outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
          outlinedButtonPressedBorderWidth: 2.0.r,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          sliderValueTinted: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          popupMenuRadius: 6.0.r,
          popupMenuElevation: 8.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 6.0.r,
          menuElevation: 8.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
          bottomNavigationBarSelectedLabelSize: 10,
          bottomNavigationBarUnselectedLabelSize: 10,
          bottomNavigationBarElevation: 0.0,
          bottomSheetRadius: 24.r,
          bottomSheetBackgroundColor: SchemeColor.error,
          bottomSheetElevation: 0.0,
          bottomSheetModalBackgroundColor: null,
          bottomSheetModalElevation: 0.0,
         ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
}
