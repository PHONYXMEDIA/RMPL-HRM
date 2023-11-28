import 'package:flutter/foundation.dart' show immutable;
import 'package:rmpl_hrm/components/dialogs/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
          title: 'Logout',
          message: 'Are you sure you want to logout?',
          buttons: const {
            'Cancel': false,
            'Logout': true,
          },
        );
}
