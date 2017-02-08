library modal_dialog;

import 'dart:async';

import 'src/core.dart';

export 'src/core.dart';

/// Gets the current modal window instance.
final ModalWindow modalWindow = new ModalWindow();

/// Closes the modal window.
void close() => modalWindow.close();

/// Shows an alert dialog with a [message] and a [title].
///
/// For example:
///
///     await alert('Something went wrong!');
///     print("Ok, you've been alerted");
///
Future<Null> alert(String message, {String title}) {
  final c = new Completer();

  close();
  new ModalAlert(modalWindow, title ?? 'Alert', message,
      accept: () => c.isCompleted || c.complete());
  return c.future;
}

/// Shows a confirm dialog with a [message] and a [title].
///
/// For example:
///
///     if (await confirm('Are you sure?')) {
///       print('Your whishes are my orders');
///     }
///
Future<bool> confirm(String message, {String title}) {
  final c = new Completer();

  close();
  new ModalConfirm(modalWindow, title ?? 'Confirm', message,
      accept: () => c.isCompleted || c.complete(true),
      cancel: () => c.isCompleted || c.complete(false));
  return c.future;
}
