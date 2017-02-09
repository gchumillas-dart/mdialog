import 'package:domelement/core.dart';

import 'modal_block.dart';

// TODO: reemplazar "modal-window" por algo más complejo para evitar
/// Represents a modal window.
class ModalWindow {
  static ModalWindow _instance;
  DomElement _element;
  DomElement _container;

  /// Creates or gets the modal window instance.
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

  /// Target element.
  DomElement get element => _element;

  /// Container target.
  DomElement get container => _container;

  /// Adds a [className] to the container element.
  void addClass(String className) => _container.addClass(className);

  /// Adds a [block] to the container.
  void add(ModalBlock block) {
    _container.addElement(block.element);
  }

  /// Closes the modal window.
  void close() {
    if (_container != null) {
      _container.remove();
    }

    _container = $('<div />')
      ..addClass('modal-window-container')
      ..addTo(_element);
  }
}
