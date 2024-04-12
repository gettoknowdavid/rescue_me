import 'package:flutter/material.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingsViewModel extends BaseViewModel with ListenableServiceMixin {
  SettingsViewModel() {
    listenToReactiveValues([_themeMode]);
  }

  final _themeMode = ReactiveValue<ThemeMode>(ThemeMode.light);
  ThemeMode get themeMode => _themeMode.value;

  final _navigationService = locator<NavigationService>();

  Future<void> goToAbout() => _navigationService.navigateToAboutView();

  Future<void> goToHelpSupport() => _navigationService.navigateToComingSoonView(
        title: 'Help & Support',
      );

  void onThemeChanged(bool? value, BuildContext context) {
    if (value == true) {
      _themeMode.value = ThemeMode.dark;
      notifyListeners();
    } else {
      _themeMode.value = ThemeMode.light;
      notifyListeners();
    }

    getThemeManager(context).setThemeMode(_themeMode.value);
  }
}
