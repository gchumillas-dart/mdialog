import 'package:domelement/core.dart';

/// Represents a block inside a modal dialog.
class ModalBlock {
  DomElement _element;

  /// Creates a block with a [className].
  ModalBlock([String className]) {
    _element = $('<div class="modal-window-block" />');

    if (className != null) {
      element.addClass(className);
    }
  }

  /// Gets the element instance.
  DomElement get element => _element;

  /// Adds a [className] to the block.
  void addClass(String className) => _element.addClass(className);

  /// Element text.
  String get text => _element.text;
  set text(String value) {
    _element.text = value;
  }
}
