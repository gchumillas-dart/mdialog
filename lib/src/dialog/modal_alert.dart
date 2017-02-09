import 'modal_dialog.dart';

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
  ModalAlert(String title, String message, {Function accept})
      : super(title, message) {
    modalWindow.container.addClass('alert');

    final acceptBtn = addButton('Accept');
    if (accept != null) {
      acceptBtn.on('click', accept);
    }
  }
}
