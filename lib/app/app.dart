import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/app/app.locator.dart';
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
import '../ui/bottom_sheets/emergency_contact/emergency_contact_sheet.dart';
import '../ui/bottom_sheets/first_aid/first_aid_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import '../ui/bottom_sheets/sos_photos/sos_photos_sheet.dart';
import '../ui/bottom_sheets/sos_text/sos_text_sheet.dart';
import '../ui/common/app_theme.dart';
import '../ui/dialogs/logout/logout_dialog.dart';
import '../ui/dialogs/mail_app/mail_app_dialog.dart';
import '../ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import '../ui/dialogs/sos/sos_dialog.dart';
import '../ui/views/about/about_view.dart';
import '../ui/views/add_emergency_contact/add_emergency_contact_view.dart';
import '../ui/views/add_incident/add_incident_view.dart';
import '../ui/views/coming_soon/coming_soon_view.dart';
import '../ui/views/confirmation/confirmation_view.dart';
import '../ui/views/edit_bio/edit_bio_view.dart';
import '../ui/views/edit_email/edit_email_view.dart';
import '../ui/views/edit_password/edit_password_view.dart';
import '../ui/views/emergency_contacts/emergency_contacts_view.dart';
import '../ui/views/first_aid/first_aid_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/incident_details/incident_details_view.dart';
import '../ui/views/incidents/incidents_view.dart';
import '../ui/views/layout/layout_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/notifications/notifications_view.dart';
import '../ui/views/onboarding/onboarding_view.dart';
import '../ui/views/password_recovery/password_recovery_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/re_auth/re_auth_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/sos/sos_view.dart';
import '../ui/views/sos_reports/sos_reports_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/update_phone/update_phone_view.dart';
import '../ui/views/verify_email/verify_email_view.dart';
import '../ui/views/verify_phone/verify_phone_view.dart';
import 'app.router.dart';
import 'package:rescue_me/ui/bottom_sheets/sos/sos_sheet.dart';
import 'package:rescue_me/ui/views/map/map_view.dart';
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
    MaterialRoute(page: EmergencyContactsView),
    MaterialRoute(page: FirstAidView),
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
    MaterialRoute(page: ComingSoonView),
    MaterialRoute(page: MapView),
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
    StackedBottomsheet(classType: SosSheet),
// @stacked-bottom-sheet
  ],
)
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppLifecycleListener _listener;

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(onStateChange: _onStateChanged);
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        locator<NetworkService>().pause();
        break;
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        if (locator<NetworkService>().isPaused) {
          locator<NetworkService>().resume();
        }
        break;
    }
  }

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
