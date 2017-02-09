import 'package:domelement/core.dart';
import 'package:modal_dialog/src/modal_block.dart';
import 'package:modal_dialog/src/modal_window.dart';

/// Represents a modal dialog.
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

  /// Gets the modal window instance.
  ModalWindow get modalWindow => _modalWindow;

  /// Adds a button with a [label].
  DomElement addButton(String label) {
    return $('<button type="button" />')
      ..text = label
      ..addTo(_footer.element);
  }
}
