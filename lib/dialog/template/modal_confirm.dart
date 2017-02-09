part of modal_dialog.dialog.template;

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
  ModalConfirm(String title, String message, {Callback accept, Callback cancel})
      : super(title, message, accept: accept) {
    modalWindow.addClass('confirm');
    addButton('Cancel', cancel);
    modalWindow.open();
  }
}
