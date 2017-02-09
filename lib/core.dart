/// Provides a set of modal window functions.
library modal_dialog;

import 'dart:async';

import 'dialog/template/core.dart';

/// Shows an alert dialog with a [message] and a [title].
///
/// Example:
///
///     await alert('Something went wrong!');
///     print("Ok, you've been alerted");
///
Future<Null> alert(String message, {String title}) {
  final c = new Completer<Null>();

  new ModalAlert(title ?? 'Alert', message, accept: (dialog) {
    if (!c.isCompleted) {
      c.complete();
    }

    dialog.close();
  });

  return c.future;
}

/// Shows a confirm dialog with a [message] and a [title].
///
/// Example:
///
///     if (await confirm('Are you sure?')) {
///       print('Your whishes are my orders');
///     }
///
Future<bool> confirm(String message, {String title}) {
  final c = new Completer<bool>();

  new ModalConfirm(title ?? 'Confirm', message, accept: (dialog) {
    if (!c.isCompleted) {
      c.complete(true);
    }

    dialog.close();
  }, cancel: (dialog) {
    if (!c.isCompleted) {
      c.complete(false);
    }

    dialog.close();
  });

  return c.future;
}
