import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  User get user => _authService.user!;

  Future<void> goToEditBio() async => _navService.navigateToEditBioView();

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
