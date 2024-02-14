import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/services/open_mail_app_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:rescue_me/ui/views/confirmation/confirmation_view.dart';
import 'package:rescue_me/ui/views/contact/contact_view.dart';
import 'package:rescue_me/ui/views/home/home_view.dart';
import 'package:rescue_me/ui/views/layout/layout_view.dart';
import 'package:rescue_me/ui/views/login/login_view.dart';
import 'package:rescue_me/ui/views/onboarding/onboarding_view.dart';
import 'package:rescue_me/ui/views/password_recovery/password_recovery_view.dart';
import 'package:rescue_me/ui/views/profile/profile_view.dart';
import 'package:rescue_me/ui/views/register/register_view.dart';
import 'package:rescue_me/ui/views/settings/settings_view.dart';
import 'package:rescue_me/ui/views/startup/startup_view.dart';
import 'package:rescue_me/ui/views/verify_email/verify_email_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/common/app_theme.dart';
import '../ui/dialogs/mail_app/mail_app_dialog.dart';
import '../ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import 'app.router.dart';
import 'package:rescue_me/services/cloud_store_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: PasswordRecoveryView),
    MaterialRoute(
      page: LayoutView,
      children: [
        MaterialRoute(page: HomeView),
        MaterialRoute(page: ContactView),
        MaterialRoute(page: ProfileView),
      ],
    ),
    MaterialRoute(page: ConfirmationView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: OpenMailAppService),
    InitializableSingleton(classType: SharedPreferencesService),
    LazySingleton(classType: CloudStoreService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: MailAppDialog),
    StackedDialog(classType: NoMailAppDialog),
  ],
// @stacked-dialog
)
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.sp),
          ),
          child: child!,
        ),
      ),
    );
  }
}
