import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/models/help_line.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/cloud_store_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<HelpLine?>> {
  final _authService = locator<AuthService>();
  final _cloudService = locator<CloudStoreService>();
  final _navigationService = locator<NavigationService>();

  void goToOnboarding() => _navigationService.navigateTo(Routes.onboardingView);

  String? get firstName => user?.displayName?.split(' ')[0];

  User? get user => _authService.user;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  @override
  Future<List<HelpLine?>> futureToRun() => _cloudService.getHelplines();
}
