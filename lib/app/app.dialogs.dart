// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/logout/logout_dialog.dart';
import '../ui/dialogs/mail_app/mail_app_dialog.dart';
import '../ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import '../ui/dialogs/sos/sos_dialog.dart';

enum DialogType {
  mailApp,
  noMailApp,
  logout,
  sos,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.mailApp: (context, request, completer) =>
        MailAppDialog(request: request, completer: completer),
    DialogType.noMailApp: (context, request, completer) =>
        NoMailAppDialog(request: request, completer: completer),
    DialogType.logout: (context, request, completer) =>
        LogoutDialog(request: request, completer: completer),
    DialogType.sos: (context, request, completer) =>
        SosDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
