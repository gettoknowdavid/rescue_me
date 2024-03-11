import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart' as fcp;
import 'package:intl_phone_field/phone_number.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/app/app.bottomsheets.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/app/app.router.dart';
import 'package:rescue_me/app/app.snackbars.dart';
import 'package:rescue_me/core/constants/error_strings.dart';
import 'package:rescue_me/models/emergency_contact.dart';
import 'package:rescue_me/services/emergency_contacts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

typedef EMCList = List<EmergencyContact?>;
typedef EMCViewModel = EmergencyContactsViewModel;

class EmergencyContactsViewModel extends ReactiveViewModel with Initialisable {
  final _bottomSheetService = locator<BottomSheetService>();
  final _emcService = locator<EmergencyContactsService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();

  List<EmergencyContact?> get contacts => _emcService.contacts;
  bool get isLoading => _emcService.isLoading;

  Future<void> call(String phoneNumber) async {
    final url = Uri.parse('tel:+$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _snackBarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: 'An error occurred. Please try again.',
      );
    }
  }

  Future<void> sendMessage(String phoneNumber) async {
    final url = Uri.parse('sms:+$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _snackBarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: 'An error occurred. Please try again.',
      );
    }
  }

  IconData getIcon(EmergencyContactType type) => switch (type) {
        EmergencyContactType.police => PhosphorIconsDuotone.policeCar,
        EmergencyContactType.ambulance => PhosphorIconsDuotone.star,
        EmergencyContactType.fire => PhosphorIconsDuotone.fire,
        EmergencyContactType.personal => PhosphorIconsDuotone.asterisk,
      };

  Future<void> refresh() => _emcService.getEmergencyContacts();

  void goToContactFormView() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emergencyContact,
      useRootNavigator: true,
      isScrollControlled: true,
    );

    if (result?.data == true) {
      await _navigationService.navigateToAddEmergencyContactView();
    } else {
      final phoneContact = await fcp.FlutterContactPicker.pickFullContact();
      final cNumber = phoneContact.phones[0].number!.replaceAll(' ', '');

      PhoneNumber? phone;
      try {
        phone = PhoneNumber.fromCompleteNumber(completeNumber: cNumber);
      } catch (e) {
        phone = PhoneNumber(
          countryISOCode: 'NG',
          countryCode: '+234',
          number: cNumber,
        );
      }

      final contact = EmergencyContact(
        uid: const Uuid().v4(),
        name: '${phoneContact.name?.firstName}',
        phone: phone.completeNumber,
        type: EmergencyContactType.personal,
        isPriority: false,
      );

      await _navigationService.navigateToAddEmergencyContactView(
        contact: contact,
        isEditing: false,
      );
    }
  }

  Future<void> deleteContact(EmergencyContact contact) async {
    final result = await _emcService.deleteEmergencyContact(contact);

    return result.fold(
      (failure) => _snackBarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.error,
        message: failure.maybeMap(
          orElse: () => '',
          serverError: (_) => keServer,
          error: (value) => value.message ?? 'Some funny kind of error',
          timeOut: (_) => keTimeout,
        ),
      ),
      (success) => null,
    );
  }

  void goToEditEmergencyContact(EmergencyContact contact) {
    _navigationService.navigateToAddEmergencyContactView(
      contact: contact,
      isEditing: true,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_emcService];

  @override
  Future<void> initialise() => _emcService.getEmergencyContacts();
}
