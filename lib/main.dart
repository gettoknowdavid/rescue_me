import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rescue_me/app/app.dialogs.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.bottomsheets.dart';
import 'app/app.dart';
import 'app/app.locator.dart';
import 'app/app.snackbars.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    setupLocator(),
    ThemeManager.initialise(),
    setupSnackbarUI(),
  ]);

  setupBottomSheetUi();
  setupDialogUi();
  runApp(const App());
}
