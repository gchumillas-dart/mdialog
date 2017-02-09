import 'modal_alert.dart';

/// Represents a modal confirm dialog.
class ModalConfirm extends ModalAlert {
  /// Creates a modal confirm dialog with a [title] and a [message].
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
  ModalConfirm(String title, String message, {Function accept, Function cancel})
      : super(title, message, accept: accept) {
    modalWindow.container.addClass('confirm');

    final cancelBtn = addButton('Cancel');
    if (cancel != null) {
      cancelBtn.on('click', cancel);
    }
  }
}
