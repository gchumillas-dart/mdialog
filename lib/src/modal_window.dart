part of modal_dialog.src;

// TODO: reemplazar "modal-window" por algo más complejo para evitar interferencias
class ModalWindow {
  DomElement _element;
  DomElement _container;

  ModalWindow() {
    _element = $('<div />')
      ..addClass('modal-window')
      ..addTo(find('body'));

    _container = $('<div />')
      ..addClass('modal-window-container')
      ..addTo(_element);
  }

  DomElement get element => _element;
  DomElement get container => _container;

  void add(ModalBlock block) {
    _container.addElement(block.element);
  }
}
