library mdialog.dialogs;

import 'package:domelement/core.dart';
import 'package:mdialog/mdialog.dart';

/// Callback function.
///
/// This function is called when the user presses any button
/// from a modal dialog.
typedef void Callback(ModalDialog dialog);

/// Modal dialog.
class ModalDialog {
  /// Dialog title
  final String title;

  /// Dialog message
  final String message;

  ModalWindow _modalWindow;
  ModalBlock _footer;

  /// Creates a modal dialog with a [title] and a [message].
  ///
  /// Example:
  ///
  ///     final dialog = new ModalDialog(
  ///       'Please confirm',
  ///       'Do you want to remove the record?'
  ///     );
  ///     dialog.addButton('Accept').on(
  ///       'click', () => print('Deleting record...')
  ///     );
  ///     dialog.addButton('Cancel');
  ///
  ModalDialog(this.title, this.message) {
    _modalWindow = new ModalWindow();
    _modalWindow.add(new ModalBlock('header')..text = title);
    _modalWindow.add(new ModalBlock('body')..text = message);
    _modalWindow.add(_footer = new ModalBlock('footer'));
  }

  /// Modal window instance.
  ModalWindow get modalWindow => _modalWindow;

  /// Adds a button with a [label].
  ///
  /// When the user presses the button, it calls the [action] function.
  DomElement addButton(String label, {Callback action}) {
    final btn = $('<button type="button" />')
      ..text = label
      ..addTo(_footer.element);

    if (action != null) {
      btn.on('click', () => Function.apply(action, [this]));
    }

    return btn;
  }

  /// Closes the modal dialog.
  void close() => _modalWindow.close();
}

/// Modal alert dialog.
class ModalAlert extends ModalDialog {
  /// Creates a modal alert dialog with a [title] and a [message].
  ///
  /// When the user presses the `Accept` button, it calls the [accept] function.
  ///
  /// Example:
  ///
  ///     new ModalAlert(
  ///       'Error!',
  ///       'An error has occurred',
  ///       accept: () => print('Do something')
  ///     );
  ///
  ModalAlert(String title, String message,
      {Callback accept, String acceptLabel = 'Accept'})
      : super(title, message) {
    modalWindow.addClass('alert');
    final btn = addButton(acceptLabel, action: accept);
    modalWindow.open();
    btn.nativeElement.focus();
  }
}

/// Modal confirm dialog.
class ModalConfirm extends ModalAlert {
  /// Creates a modal confirm dialog with a [title] and a [message].
  ///
  /// When the user presses the `Accept` or the `Cancel` button, it calls the
  /// [accept] or the [cancel] function respectively.
  ///
  /// Example:
  ///
  ///     new ModalConfirm(
  ///       'Please confirm',
  ///       'Do you want to delete the record?',
  ///       accept: () => print('Deleting record...'),
  ///       cancel: () => print('Do something')
  ///     );
  ///
  ModalConfirm(String title, String message,
      {Callback accept,
      Callback cancel,
      String acceptLabel = 'Accept',
      String cancelLabel = 'Cancel'})
      : super(title, message, accept: accept, acceptLabel: acceptLabel) {
    modalWindow.addClass('confirm');
    addButton(cancelLabel, action: cancel);
    modalWindow.open();
  }
}
