import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/models/dashboard_item.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _sosService = locator<SosService>();

  void goToOnboarding() => _navigationService.navigateTo(Routes.onboardingView);

  String? get firstName => user?.name.split(' ')[0];

  User? get user => _authService.user;

  final List<DashboardItem> items = [
    DashboardItem(
      title: 'Incident Reports',
      icon: PhosphorIconsDuotone.rss,
      color: const Color(0xFFFFF351),
      secondaryColor: const Color(0xFFFFFDDC),
      route: Routes.incidentsView,
    ),
    DashboardItem(
      title: 'SOS Reports',
      icon: PhosphorIconsDuotone.asterisk,
      color: const Color(0xFFFF5168),
      secondaryColor: const Color(0xFFFFDCE2),
      route: Routes.sosReportsView,
    ),
  
    DashboardItem(
      title: 'Emergency Numbers',
      icon: PhosphorIconsDuotone.usersThree,
      color: const Color(0xFF5799ff),
      secondaryColor: const Color(0xFFdbe9ff),
      route: Routes.emergencyContactsView,
    ),
    DashboardItem(
      title: 'Nearby Hospitals',
      icon: PhosphorIconsDuotone.heartbeat,
      color: const Color(0xFFff7951),
      secondaryColor: const Color(0xFFffe4dc),
      route: Routes.hospitalsView,
    ),
    DashboardItem(
      title: 'First Aid',
      icon: PhosphorIconsDuotone.bandaids,
      color: const Color(0xff3b998e),
      secondaryColor: const Color(0xFFcfffe8),
      route: Routes.firstAidView,
    ),
    DashboardItem(
      title: 'Medical Courses',
      icon: PhosphorIconsDuotone.books,
      color: const Color(0xFFa863f1),
      secondaryColor: const Color(0xFFeddcff),
      route: Routes.coursesView,
    ),
  ];

  Stream<EmergencyReport?> get emergencyStream => _sosService.emergency;

  void goToDashboardItem(String route) => switch (route) {
        Routes.incidentsView => _navigationService.navigateToIncidentsView(),
        Routes.sosReportsView => _navigationService.navigateToSosReportsView(),
        Routes.hospitalsView => _navigationService.navigateToHospitalsView(),
        Routes.emergencyContactsView =>
          _navigationService.navigateToEmergencyContactsView(),
        Routes.firstAidView => _navigationService.navigateToFirstAidView(),
        Routes.coursesView => _navigationService.navigateToCoursesView(),
        _ => null
      };

  Future<void> goToSOS(EmergencyReport? report) async {
    if (report == null) return;
    return await _navigationService.navigateToSosView(report: report);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
