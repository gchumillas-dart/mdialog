part of modal_dialog.dialog;

/// This suffix added to the beggining of the classes.
final _classPrefix = 'modal-dialog';

/// Modal window.
class ModalWindow {
  static ModalWindow _instance;
  DomElement _element;
  DomElement _container;

  /// Creates or gets the modal window instance.
  ///
  /// The modal window is created only once, so this method returns the
  /// current instance or creates a new one.
  ///
  /// Example:
  ///
  ///     final modalWindow1 = new ModalWindow();
  ///     final modalWindow2 = new ModalWindow();
  ///
  ///     // the following command prints 'true'
  ///     print(modalWindow1 == modalWindow2);
  ///
  factory ModalWindow() {
    if (_instance == null) {
      _instance = new ModalWindow._internal();
    }

    return _instance..close();
  }

  ModalWindow._internal() {
    _element = $('<div />')
      ..addClass(_classPrefix)
      ..addTo(find('body'));
  }

  /// The undeerlying element of the window's container.
  DomElement get container => _container;

  /// The underlying element of the window.
  DomElement get element => _element;

  /// Adds a [block] to the container.
  void add(ModalBlock block) {
    _container.addElement(block.element);
  }

  /// Adds a [className] to the container element.
  void addClass(String className) => _container.addClass(className);

  /// Closes the modal window.
  void close() {
    if (_container != null) {
      _container.remove();
    }

    _container = $('<div />')
      ..addClass('$_classPrefix-container')
      ..addTo(_element);
  }
}
