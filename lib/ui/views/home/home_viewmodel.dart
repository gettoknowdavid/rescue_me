import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/dashboard_item.dart';
import '../../../models/user.dart';
import '../../../services/auth_service.dart';
import '../../../services/notifications_service.dart';
import '../../../services/sos_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _notificationService = locator<NotificationsService>();
  final _sosService = locator<SosService>();

  Stream<bool> get hasNotifications => _notificationService.hasNotifications;

  Stream<int> get notificationNumber => _notificationService.notificationNumber;

  void goToNotifications() => _navigationService.navigateToNotificationsView();

  String? get firstName => user?.name.split(' ')[0];

  User? get user => _authService.user;

  final List<DashboardItem> items = [
    DashboardItem(
      id: 1,
      title: 'Incident Reports',
      icon: PhosphorIconsDuotone.rss,
      color: const Color(0xFFFFF351),
      secondaryColor: const Color(0xFFFFFDDC),
      route: Routes.incidentsView,
    ),
    DashboardItem(
      id: 2,
      title: 'SOS Reports',
      icon: PhosphorIconsDuotone.asterisk,
      color: const Color(0xFFFF5168),
      secondaryColor: const Color(0xFFFFDCE2),
      route: Routes.sosReportsView,
    ),
    DashboardItem(
      id: 3,
      title: 'Emergency Numbers',
      icon: PhosphorIconsDuotone.usersThree,
      color: const Color(0xFF5799ff),
      secondaryColor: const Color(0xFFdbe9ff),
      route: Routes.emergencyContactsView,
    ),
    DashboardItem(
      id: 4,
      title: 'First Aid',
      icon: PhosphorIconsDuotone.bandaids,
      color: const Color(0xff3b998e),
      secondaryColor: const Color(0xFFcfffe8),
      route: Routes.firstAidView,
    ),
    DashboardItem(
      id: 5,
      title: 'Nearby Hospitals',
      icon: PhosphorIconsDuotone.heartbeat,
      color: const Color(0xFFff7951),
      secondaryColor: const Color(0xFFffe4dc),
      route: Routes.comingSoonView,
    ),
    DashboardItem(
      id: 6,
      title: 'Medical Courses',
      icon: PhosphorIconsDuotone.books,
      color: const Color(0xFFa863f1),
      secondaryColor: const Color(0xFFeddcff),
      route: Routes.comingSoonView,
    ),
  ];

  Stream<EmergencyReport?> get emergencyStream => _sosService.emergency;

  void goToDashboardItem(int id) => switch (id) {
        1 => _navigationService.navigateToIncidentsView(),
        2 => _navigationService.navigateToSosReportsView(),
        3 => _navigationService.navigateToEmergencyContactsView(),
        4 => _navigationService.navigateToFirstAidView(),
        5 => _comingSoon('Nearby Hospitals'),
        6 => _comingSoon('Medical Courses'),
        _ => null
      };

  void _comingSoon(String title) =>
      _navigationService.navigateToComingSoonView(title: title);

  Future<void> goToSOS(EmergencyReport? report) async {
    if (report == null) return;
    return await _navigationService.navigateToSosView(report: report);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
