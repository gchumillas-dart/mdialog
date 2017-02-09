part of modal_dialog;

/// Block inside a modal dialog.
class ModalBlock {
  DomElement _element;

  /// Creates a block with a [className].
  ModalBlock([String className]) {
    _element = $('<div class="modal-window-block" />');

    if (className != null) {
      element.addClass(className);
    }
  }

  /// The underlying element of the block.
  DomElement get element => _element;

  /// Adds a [className] to the block.
  void addClass(String className) => _element.addClass(className);

  /// Block text.
  String get text => _element.text;
  set text(String value) {
    _element.text = value;
  }
}
