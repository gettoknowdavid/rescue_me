import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'app/app.locator.dart';
import 'app/app.snackbars.dart';
import 'core/env/env.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey),
    setupLocator(),
    setupSnackbarUI()
  ]);
  runApp(const App());
}
