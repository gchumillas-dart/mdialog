import 'package:domelement/core.dart';

import 'modal_block.dart';

// TODO: reemplazar "modal-window" por algo más complejo para evitar interferencias
class ModalWindow {
  static ModalWindow _instance;
  DomElement _element;
  DomElement _container;

  factory ModalWindow() {
    if (_instance == null) {
      _instance = new ModalWindow._internal();
    }

    return _instance..close();
  }

  ModalWindow._internal() {
    _element = $('<div />')
      ..addClass('modal-window')
      ..addTo(find('body'));
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

    _container = $('<div />')
      ..addClass('modal-window-container')
      ..addTo(_element);
  }
}
