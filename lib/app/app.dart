import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/cloud_store_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/services/open_mail_app_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:rescue_me/ui/bottom_sheets/emergency_contact/emergency_contact_sheet.dart';
import 'package:rescue_me/ui/views/add_emergency_contact/add_emergency_contact_view.dart';
import 'package:rescue_me/ui/views/confirmation/confirmation_view.dart';
import 'package:rescue_me/ui/views/contact/contact_view.dart';
import 'package:rescue_me/ui/views/courses/courses_view.dart';
import 'package:rescue_me/ui/views/emergency_contacts/emergency_contacts_view.dart';
import 'package:rescue_me/ui/views/first_aid/first_aid_view.dart';
import 'package:rescue_me/ui/views/home/home_view.dart';
import 'package:rescue_me/ui/views/hospitals/hospitals_view.dart';
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
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/ui/bottom_sheets/image_source/image_source_sheet.dart';
import 'package:rescue_me/services/emergency_contacts_service.dart';
import 'package:rescue_me/ui/views/edit_bio/edit_bio_view.dart';
import 'package:rescue_me/ui/views/edit_password/edit_password_view.dart';
import 'package:rescue_me/ui/views/re_auth/re_auth_view.dart';
import 'package:rescue_me/ui/views/edit_email/edit_email_view.dart';
import 'package:rescue_me/ui/dialogs/logout/logout_dialog.dart';
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
        MaterialRoute(page: SettingsView),
      ],
    ),
    MaterialRoute(page: ConfirmationView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: HospitalsView),
    MaterialRoute(page: EmergencyContactsView),
    MaterialRoute(page: FirstAidView),
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: AddEmergencyContactView),
    MaterialRoute(page: EditBioView),
    MaterialRoute(page: EditPasswordView),
    MaterialRoute(page: ReAuthView),
    MaterialRoute(page: EditEmailView),
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
    LazySingleton(classType: MediaService),
    LazySingleton(classType: EmergencyContactsService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: MailAppDialog),
    StackedDialog(classType: NoMailAppDialog),
    StackedDialog(classType: LogoutDialog),
// @stacked-dialog
  ],
  bottomsheets: [
    StackedBottomsheet(classType: EmergencyContactSheet),
    StackedBottomsheet(classType: ImageSourceSheet),
    // @stacked-bottom-sheet
  ],
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
