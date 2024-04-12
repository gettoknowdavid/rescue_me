// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i32;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i30;
import 'package:rescue_me/models/incident.dart' as _i33;
import 'package:rescue_me/models/user.dart' as _i31;
import 'package:rescue_me/ui/views/about/about_view.dart' as _i29;
import 'package:rescue_me/ui/views/add_emergency_contact/add_emergency_contact_view.dart'
    as _i17;
import 'package:rescue_me/ui/views/add_incident/add_incident_view.dart' as _i24;
import 'package:rescue_me/ui/views/confirmation/confirmation_view.dart' as _i10;
import 'package:rescue_me/ui/views/courses/courses_view.dart' as _i16;
import 'package:rescue_me/ui/views/edit_bio/edit_bio_view.dart' as _i18;
import 'package:rescue_me/ui/views/edit_email/edit_email_view.dart' as _i21;
import 'package:rescue_me/ui/views/edit_password/edit_password_view.dart'
    as _i19;
import 'package:rescue_me/ui/views/emergency_contacts/emergency_contacts_view.dart'
    as _i14;
import 'package:rescue_me/ui/views/first_aid/first_aid_view.dart' as _i15;
import 'package:rescue_me/ui/views/home/home_view.dart' as _i2;
import 'package:rescue_me/ui/views/hospitals/hospitals_view.dart' as _i13;
import 'package:rescue_me/ui/views/incident_details/incident_details_view.dart'
    as _i26;
import 'package:rescue_me/ui/views/incidents/incidents_view.dart' as _i9;
import 'package:rescue_me/ui/views/layout/layout_view.dart' as _i8;
import 'package:rescue_me/ui/views/login/login_view.dart' as _i6;
import 'package:rescue_me/ui/views/notifications/notifications_view.dart'
    as _i28;
import 'package:rescue_me/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:rescue_me/ui/views/password_recovery/password_recovery_view.dart'
    as _i7;
import 'package:rescue_me/ui/views/profile/profile_view.dart' as _i12;
import 'package:rescue_me/ui/views/re_auth/re_auth_view.dart' as _i20;
import 'package:rescue_me/ui/views/register/register_view.dart' as _i5;
import 'package:rescue_me/ui/views/settings/settings_view.dart' as _i34;
import 'package:rescue_me/ui/views/sos/sos_view.dart' as _i22;
import 'package:rescue_me/ui/views/sos_reports/sos_reports_view.dart' as _i25;
import 'package:rescue_me/ui/views/startup/startup_view.dart' as _i3;
import 'package:rescue_me/ui/views/update_phone/update_phone_view.dart' as _i27;
import 'package:rescue_me/ui/views/verify_email/verify_email_view.dart' as _i11;
import 'package:rescue_me/ui/views/verify_phone/verify_phone_view.dart' as _i23;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i35;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const registerView = '/register-view';

  static const loginView = '/login-view';

  static const passwordRecoveryView = '/password-recovery-view';

  static const layoutView = '/layout-view';

  static const incidentsView = '/incidents-view';

  static const confirmationView = '/confirmation-view';

  static const verifyEmailView = '/verify-email-view';

  static const profileView = '/profile-view';

  static const hospitalsView = '/hospitals-view';

  static const emergencyContactsView = '/emergency-contacts-view';

  static const firstAidView = '/first-aid-view';

  static const coursesView = '/courses-view';

  static const addEmergencyContactView = '/add-emergency-contact-view';

  static const editBioView = '/edit-bio-view';

  static const editPasswordView = '/edit-password-view';

  static const reAuthView = '/re-auth-view';

  static const editEmailView = '/edit-email-view';

  static const sosView = '/sos-view';

  static const verifyPhoneView = '/verify-phone-view';

  static const addIncidentView = '/add-incident-view';

  static const sosReportsView = '/sos-reports-view';

  static const incidentDetailsView = '/incident-details-view';

  static const updatePhoneView = '/update-phone-view';

  static const notificationsView = '/notifications-view';

  static const aboutView = '/about-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    registerView,
    loginView,
    passwordRecoveryView,
    layoutView,
    incidentsView,
    confirmationView,
    verifyEmailView,
    profileView,
    hospitalsView,
    emergencyContactsView,
    firstAidView,
    coursesView,
    addEmergencyContactView,
    editBioView,
    editPasswordView,
    reAuthView,
    editEmailView,
    sosView,
    verifyPhoneView,
    addIncidentView,
    sosReportsView,
    incidentDetailsView,
    updatePhoneView,
    notificationsView,
    aboutView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i5.RegisterView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.passwordRecoveryView,
      page: _i7.PasswordRecoveryView,
    ),
    _i1.RouteDef(
      Routes.layoutView,
      page: _i8.LayoutView,
    ),
    _i1.RouteDef(
      Routes.incidentsView,
      page: _i9.IncidentsView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i10.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.verifyEmailView,
      page: _i11.VerifyEmailView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      Routes.hospitalsView,
      page: _i13.HospitalsView,
    ),
    _i1.RouteDef(
      Routes.emergencyContactsView,
      page: _i14.EmergencyContactsView,
    ),
    _i1.RouteDef(
      Routes.firstAidView,
      page: _i15.FirstAidView,
    ),
    _i1.RouteDef(
      Routes.coursesView,
      page: _i16.CoursesView,
    ),
    _i1.RouteDef(
      Routes.addEmergencyContactView,
      page: _i17.AddEmergencyContactView,
    ),
    _i1.RouteDef(
      Routes.editBioView,
      page: _i18.EditBioView,
    ),
    _i1.RouteDef(
      Routes.editPasswordView,
      page: _i19.EditPasswordView,
    ),
    _i1.RouteDef(
      Routes.reAuthView,
      page: _i20.ReAuthView,
    ),
    _i1.RouteDef(
      Routes.editEmailView,
      page: _i21.EditEmailView,
    ),
    _i1.RouteDef(
      Routes.sosView,
      page: _i22.SosView,
    ),
    _i1.RouteDef(
      Routes.verifyPhoneView,
      page: _i23.VerifyPhoneView,
    ),
    _i1.RouteDef(
      Routes.addIncidentView,
      page: _i24.AddIncidentView,
    ),
    _i1.RouteDef(
      Routes.sosReportsView,
      page: _i25.SosReportsView,
    ),
    _i1.RouteDef(
      Routes.incidentDetailsView,
      page: _i26.IncidentDetailsView,
    ),
    _i1.RouteDef(
      Routes.updatePhoneView,
      page: _i27.UpdatePhoneView,
    ),
    _i1.RouteDef(
      Routes.notificationsView,
      page: _i28.NotificationsView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i29.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.RegisterView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.PasswordRecoveryView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.PasswordRecoveryView(),
        settings: data,
      );
    },
    _i8.LayoutView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LayoutView(),
        settings: data,
      );
    },
    _i9.IncidentsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.IncidentsView(),
        settings: data,
      );
    },
    _i10.ConfirmationView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ConfirmationView(),
        settings: data,
      );
    },
    _i11.VerifyEmailView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.VerifyEmailView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ProfileView(),
        settings: data,
      );
    },
    _i13.HospitalsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.HospitalsView(),
        settings: data,
      );
    },
    _i14.EmergencyContactsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.EmergencyContactsView(),
        settings: data,
      );
    },
    _i15.FirstAidView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.FirstAidView(),
        settings: data,
      );
    },
    _i16.CoursesView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.CoursesView(),
        settings: data,
      );
    },
    _i17.AddEmergencyContactView: (data) {
      final args = data.getArgs<AddEmergencyContactViewArguments>(
        orElse: () => const AddEmergencyContactViewArguments(),
      );
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.AddEmergencyContactView(
            key: args.key,
            contact: args.contact,
            isEditing: args.isEditing,
            imageFile: args.imageFile),
        settings: data,
      );
    },
    _i18.EditBioView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.EditBioView(),
        settings: data,
      );
    },
    _i19.EditPasswordView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.EditPasswordView(),
        settings: data,
      );
    },
    _i20.ReAuthView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.ReAuthView(),
        settings: data,
      );
    },
    _i21.EditEmailView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.EditEmailView(),
        settings: data,
      );
    },
    _i22.SosView: (data) {
      final args = data.getArgs<SosViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.SosView(key: args.key, report: args.report),
        settings: data,
      );
    },
    _i23.VerifyPhoneView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.VerifyPhoneView(),
        settings: data,
      );
    },
    _i24.AddIncidentView: (data) {
      final args = data.getArgs<AddIncidentViewArguments>(
        orElse: () => const AddIncidentViewArguments(),
      );
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i24.AddIncidentView(key: args.key, incident: args.incident),
        settings: data,
      );
    },
    _i25.SosReportsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.SosReportsView(),
        settings: data,
      );
    },
    _i26.IncidentDetailsView: (data) {
      final args = data.getArgs<IncidentDetailsViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i26.IncidentDetailsView(key: args.key, incident: args.incident),
        settings: data,
      );
    },
    _i27.UpdatePhoneView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.UpdatePhoneView(),
        settings: data,
      );
    },
    _i28.NotificationsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.NotificationsView(),
        settings: data,
      );
    },
    _i29.AboutView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.AboutView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddEmergencyContactViewArguments {
  const AddEmergencyContactViewArguments({
    this.key,
    this.contact,
    this.isEditing = false,
    this.imageFile,
  });

  final _i30.Key? key;

  final _i31.EmergencyContact? contact;

  final bool isEditing;

  final _i32.File? imageFile;

  @override
  String toString() {
    return '{"key": "$key", "contact": "$contact", "isEditing": "$isEditing", "imageFile": "$imageFile"}';
  }

  @override
  bool operator ==(covariant AddEmergencyContactViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.contact == contact &&
        other.isEditing == isEditing &&
        other.imageFile == imageFile;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        contact.hashCode ^
        isEditing.hashCode ^
        imageFile.hashCode;
  }
}

class SosViewArguments {
  const SosViewArguments({
    this.key,
    required this.report,
  });

  final _i30.Key? key;

  final _i31.EmergencyReport report;

  @override
  String toString() {
    return '{"key": "$key", "report": "$report"}';
  }

  @override
  bool operator ==(covariant SosViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.report == report;
  }

  @override
  int get hashCode {
    return key.hashCode ^ report.hashCode;
  }
}

class AddIncidentViewArguments {
  const AddIncidentViewArguments({
    this.key,
    this.incident,
  });

  final _i30.Key? key;

  final _i33.Incident? incident;

  @override
  String toString() {
    return '{"key": "$key", "incident": "$incident"}';
  }

  @override
  bool operator ==(covariant AddIncidentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.incident == incident;
  }

  @override
  int get hashCode {
    return key.hashCode ^ incident.hashCode;
  }
}

class IncidentDetailsViewArguments {
  const IncidentDetailsViewArguments({
    this.key,
    required this.incident,
  });

  final _i30.Key? key;

  final _i33.Incident incident;

  @override
  String toString() {
    return '{"key": "$key", "incident": "$incident"}';
  }

  @override
  bool operator ==(covariant IncidentDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.incident == incident;
  }

  @override
  int get hashCode {
    return key.hashCode ^ incident.hashCode;
  }
}

class LayoutViewRoutes {
  static const homeView = 'home-view';

  static const incidentsView = 'incidents-view';

  static const profileView = 'profile-view';

  static const settingsView = 'settings-view';

  static const all = <String>{
    homeView,
    incidentsView,
    profileView,
    settingsView,
  };
}

class LayoutViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      LayoutViewRoutes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.incidentsView,
      page: _i9.IncidentsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.settingsView,
      page: _i34.SettingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i9.IncidentsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.IncidentsView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ProfileView(),
        settings: data,
      );
    },
    _i34.SettingsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.SettingsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i35.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPasswordRecoveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.passwordRecoveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIncidentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.incidentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHospitalsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.hospitalsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEmergencyContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.emergencyContactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFirstAidView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.firstAidView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEmergencyContactView({
    _i30.Key? key,
    _i31.EmergencyContact? contact,
    bool isEditing = false,
    _i32.File? imageFile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addEmergencyContactView,
        arguments: AddEmergencyContactViewArguments(
            key: key,
            contact: contact,
            isEditing: isEditing,
            imageFile: imageFile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditBioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editBioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSosView({
    _i30.Key? key,
    required _i31.EmergencyReport report,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sosView,
        arguments: SosViewArguments(key: key, report: report),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddIncidentView({
    _i30.Key? key,
    _i33.Incident? incident,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addIncidentView,
        arguments: AddIncidentViewArguments(key: key, incident: incident),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSosReportsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sosReportsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIncidentDetailsView({
    _i30.Key? key,
    required _i33.Incident incident,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.incidentDetailsView,
        arguments: IncidentDetailsViewArguments(key: key, incident: incident),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdatePhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.updatePhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedHomeViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedIncidentsViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.incidentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfileViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSettingsViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPasswordRecoveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.passwordRecoveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIncidentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.incidentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHospitalsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.hospitalsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmergencyContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.emergencyContactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFirstAidView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.firstAidView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEmergencyContactView({
    _i30.Key? key,
    _i31.EmergencyContact? contact,
    bool isEditing = false,
    _i32.File? imageFile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addEmergencyContactView,
        arguments: AddEmergencyContactViewArguments(
            key: key,
            contact: contact,
            isEditing: isEditing,
            imageFile: imageFile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditBioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editBioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSosView({
    _i30.Key? key,
    required _i31.EmergencyReport report,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sosView,
        arguments: SosViewArguments(key: key, report: report),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddIncidentView({
    _i30.Key? key,
    _i33.Incident? incident,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addIncidentView,
        arguments: AddIncidentViewArguments(key: key, incident: incident),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSosReportsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sosReportsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIncidentDetailsView({
    _i30.Key? key,
    required _i33.Incident incident,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.incidentDetailsView,
        arguments: IncidentDetailsViewArguments(key: key, incident: incident),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpdatePhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.updatePhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedHomeViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedIncidentsViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.incidentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfileViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedSettingsViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
