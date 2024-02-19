import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/models/dashboard_item.dart';
import 'package:rescue_me/models/help_line.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/cloud_store_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// final _dashboardItems =;

class HomeViewModel extends FutureViewModel<List<HelpLine?>> {
  final _authService = locator<AuthService>();
  final _cloudService = locator<CloudStoreService>();
  final _navigationService = locator<NavigationService>();

  void goToOnboarding() => _navigationService.navigateTo(Routes.onboardingView);

  String? get firstName => user?.displayName?.split(' ')[0];

  User? get user => _authService.user;

  final List<DashboardItem> items = [
    DashboardItem(
      title: 'Nearby Hospitals',
      icon: PhosphorIconsDuotone.heartbeat,
      color: const Color(0xFFff7951),
      secondaryColor: const Color(0xFFffe4dc),
      route: Routes.hospitalsView,
    ),
    DashboardItem(
      title: 'Emergency Numbers',
      icon: PhosphorIconsDuotone.usersThree,
      color: const Color(0xFF5799ff),
      secondaryColor: const Color(0xFFdbe9ff),
      route: Routes.emergencyContactsView,
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

  void goToDashboardItem(String route) => switch (route) {
        Routes.hospitalsView => _navigationService.navigateToHospitalsView(),
        Routes.emergencyContactsView =>
          _navigationService.navigateToEmergencyContactsView(),
        Routes.firstAidView => _navigationService.navigateToFirstAidView(),
        Routes.coursesView => _navigationService.navigateToCoursesView(),
        _ => null
      };

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  @override
  Future<List<HelpLine?>> futureToRun() => _cloudService.getHelplines();
}
