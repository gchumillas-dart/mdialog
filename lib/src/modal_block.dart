part of modal_dialog.src;

class ModalBlock {
  DomElement _element;

  ModalBlock([String className]) {
    _element = $('<div class="modal-window-block" />');

    if (className != null) {
      element.addClass(className);
    }
  }

  DomElement get element => _element;

  void addClass(String className) => _element.addClass(className);

  String get text => _element.text;
  set text(String value) {
    _element.text = value;
  }
}
