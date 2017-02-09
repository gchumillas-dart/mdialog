part of modal_dialog.dialog;

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

  /// Inner text.
  String get text => _element.text;

  set text(String value) {
    _element.text = value;
  }

  /// Inner html.
  String get html => _element.html;

  set html(String value) {
    _element.html = value;
  }

  /// Adds a [className] to the block.
  void addClass(String className) => _element.addClass(className);
}
