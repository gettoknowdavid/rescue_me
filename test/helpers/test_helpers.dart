import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:rescue_me/services/open_mail_app_service.dart';
import 'package:rescue_me/services/shared_preferences_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/sos_service.dart';
import 'package:rescue_me/services/location_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NetworkService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OpenMailAppService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SharedPreferencesService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MediaService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SosService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocationService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthService();
  getAndRegisterNetworkService();
  getAndRegisterOpenMailAppService();
  getAndRegisterSharedPreferencesService();
  getAndRegisterMediaService();
  getAndRegisterSosService();
  getAndRegisterLocationService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockNetworkService getAndRegisterNetworkService() {
  _removeRegistrationIfExists<NetworkService>();
  final service = MockNetworkService();
  locator.registerSingleton<NetworkService>(service);
  return service;
}

MockOpenMailAppService getAndRegisterOpenMailAppService() {
  _removeRegistrationIfExists<OpenMailAppService>();
  final service = MockOpenMailAppService();
  locator.registerSingleton<OpenMailAppService>(service);
  return service;
}

MockSharedPreferencesService getAndRegisterSharedPreferencesService() {
  _removeRegistrationIfExists<SharedPreferencesService>();
  final service = MockSharedPreferencesService();
  locator.registerSingleton<SharedPreferencesService>(service);
  return service;
}

MockMediaService getAndRegisterMediaService() {
  _removeRegistrationIfExists<MediaService>();
  final service = MockMediaService();
  locator.registerSingleton<MediaService>(service);
  return service;
}

MockSosService getAndRegisterSosService() {
  _removeRegistrationIfExists<SosService>();
  final service = MockSosService();
  locator.registerSingleton<SosService>(service);
  return service;
}

MockLocationService getAndRegisterLocationService() {
  _removeRegistrationIfExists<LocationService>();
  final service = MockLocationService();
  locator.registerSingleton<LocationService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
