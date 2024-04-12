import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/bottom_sheets/emergency_contact/emergency_contact_sheet.dart';
import 'package:rescue_me/ui/bottom_sheets/image_source/image_source_sheet.dart';
import 'package:rescue_me/ui/bottom_sheets/sos_photos/sos_photos_sheet.dart';
import 'package:rescue_me/ui/bottom_sheets/sos_text/sos_text_sheet.dart';
import 'package:rescue_me/ui/dialogs/logout/logout_dialog.dart';
import 'package:rescue_me/ui/dialogs/sos/sos_dialog.dart';
import 'package:rescue_me/ui/views/add_emergency_contact/add_emergency_contact_view.dart';
import 'package:rescue_me/ui/views/add_incident/add_incident_view.dart';
import 'package:rescue_me/ui/views/confirmation/confirmation_view.dart';
import 'package:rescue_me/ui/views/courses/courses_view.dart';
import 'package:rescue_me/ui/views/edit_bio/edit_bio_view.dart';
import 'package:rescue_me/ui/views/edit_email/edit_email_view.dart';
import 'package:rescue_me/ui/views/edit_password/edit_password_view.dart';
import 'package:rescue_me/ui/views/emergency_contacts/emergency_contacts_view.dart';
import 'package:rescue_me/ui/views/first_aid/first_aid_view.dart';
import 'package:rescue_me/ui/views/home/home_view.dart';
import 'package:rescue_me/ui/views/hospitals/hospitals_view.dart';
import 'package:rescue_me/ui/views/incident_details/incident_details_view.dart';
import 'package:rescue_me/ui/views/incidents/incidents_view.dart';
import 'package:rescue_me/ui/views/layout/layout_view.dart';
import 'package:rescue_me/ui/views/login/login_view.dart';
import 'package:rescue_me/ui/views/notifications/notifications_view.dart';
import 'package:rescue_me/ui/views/onboarding/onboarding_view.dart';
import 'package:rescue_me/ui/views/password_recovery/password_recovery_view.dart';
import 'package:rescue_me/ui/views/profile/profile_view.dart';
import 'package:rescue_me/ui/views/re_auth/re_auth_view.dart';
import 'package:rescue_me/ui/views/register/register_view.dart';
import 'package:rescue_me/ui/views/settings/settings_view.dart';
import 'package:rescue_me/ui/views/sos/sos_view.dart';
import 'package:rescue_me/ui/views/sos_reports/sos_reports_view.dart';
import 'package:rescue_me/ui/views/startup/startup_view.dart';
import 'package:rescue_me/ui/views/update_phone/update_phone_view.dart';
import 'package:rescue_me/ui/views/verify_email/verify_email_view.dart';
import 'package:rescue_me/ui/views/verify_phone/verify_phone_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/auth_service.dart';
import '../services/emergency_contacts_service.dart';
import '../services/first_aid_service.dart';
import '../services/incident_service.dart';
import '../services/location_service.dart';
import '../services/media_service.dart';
import '../services/network_service.dart';
import '../services/notifications_service.dart';
import '../services/open_mail_app_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/sos_service.dart';
import '../ui/common/app_theme.dart';
import '../ui/dialogs/mail_app/mail_app_dialog.dart';
import '../ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import 'app.router.dart';
import 'package:rescue_me/ui/bottom_sheets/first_aid/first_aid_sheet.dart';
import 'package:rescue_me/ui/views/about/about_view.dart';
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
        MaterialRoute(page: IncidentsView),
        MaterialRoute(page: ProfileView),
        MaterialRoute(page: SettingsView),
      ],
    ),
    MaterialRoute(page: IncidentsView),
    MaterialRoute(page: ConfirmationView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: HospitalsView),
    MaterialRoute(page: EmergencyContactsView),
    MaterialRoute(page: FirstAidView),
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: AddEmergencyContactView),
    MaterialRoute(page: EditBioView),
    MaterialRoute(page: EditPasswordView),
    MaterialRoute(page: ReAuthView),
    MaterialRoute(page: EditEmailView),
    MaterialRoute(page: SosView),
    MaterialRoute(page: VerifyPhoneView),
    MaterialRoute(page: AddIncidentView),
    MaterialRoute(page: SosReportsView),
    MaterialRoute(page: IncidentDetailsView),
    MaterialRoute(page: UpdatePhoneView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: AboutView),
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
    LazySingleton(classType: MediaService),
    LazySingleton(classType: EmergencyContactsService),
    LazySingleton(classType: SosService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: IncidentService),
    InitializableSingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NotificationsService),
    LazySingleton(classType: FirstAidService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: MailAppDialog),
    StackedDialog(classType: NoMailAppDialog),
    StackedDialog(classType: LogoutDialog),
    StackedDialog(classType: SosDialog),
// @stacked-dialog
  ],
  bottomsheets: [
    StackedBottomsheet(classType: EmergencyContactSheet),
    StackedBottomsheet(classType: ImageSourceSheet),
    StackedBottomsheet(classType: SosPhotosSheet),
    StackedBottomsheet(classType: SosTextSheet),
    StackedBottomsheet(classType: FirstAidSheet),
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
      builder: (_, child) => ThemeBuilder(
        lightTheme: AppTheme.light,
        darkTheme: AppTheme.dark,
        builder: (context, theme, darkTheme, themeMode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
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
      ),
    );
  }
}
