import 'package:domelement/core.dart';

import 'modal_block.dart';

final ModalWindow modalWindow = new ModalWindow();

// TODO: reemplazar "modal-window" por algo más complejo para evitar interferencias
class ModalWindow {
  DomElement _element;
  DomElement _container;

  ModalWindow() {
    _element = $('<div />')
      ..addClass('modal-window')
      ..addTo(find('body'));

    close();
  }

  DomElement get element => _element;
  DomElement get container => _container;

  void addClass(String className) => _container.addClass(className);

  void add(ModalBlock block) {
    _container.addElement(block.element);
  }

  void close() {
    if (_container != null) {
      _container.remove();
    }

    // TODO: do not repeat yourself
    _container = $('<div />')
      ..addClass('modal-window-container')
      ..addTo(_element);
  }
}
