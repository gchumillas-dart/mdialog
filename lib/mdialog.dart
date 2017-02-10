/// Provides a set of modal window functions.
library mdialog;

import 'dart:async';

import 'package:domelement/core.dart';

import 'src/dialogs.dart';

/// This suffix added to the beggining of the classes.
final _classPrefix = 'modal-dialog';

/// Shows an alert dialog with a [message] and a [title].
///
/// Example:
///
///     await alert('Something went wrong!');
///     print("Ok, you've been alerted");
///
Future<Null> alert(String message, {String title}) {
  final c = new Completer<Null>();

  new ModalAlert(title ?? 'Alert', message, accept: (dialog) {
    if (!c.isCompleted) {
      c.complete();
    }

    dialog.close();
  });

  return c.future;
}

/// Shows a confirm dialog with a [message] and a [title].
///
/// Example:
///
///     if (await confirm('Are you sure?')) {
///       print('Your whishes are my orders');
///     }
///
Future<bool> confirm(String message, {String title}) {
  final c = new Completer<bool>();

  new ModalConfirm(title ?? 'Confirm', message, accept: (dialog) {
    if (!c.isCompleted) {
      c.complete(true);
    }

    dialog.close();
  }, cancel: (dialog) {
    if (!c.isCompleted) {
      c.complete(false);
    }

    dialog.close();
  });

  return c.future;
}

/// Block inside a modal dialog.
class ModalBlock {
  DomElement _element;

  /// Creates a block with a [className].
  ModalBlock([String className]) {
    _element = $('<div class="$_classPrefix-block" />');

    if (className != null) {
      element.addClass(className);
    }
  }

  /// The underlying element of the block.
  DomElement get element => _element;

  /// Inner html.
  String get html => _element.html;

  set html(String value) {
    _element.html = value;
  }

  /// Inner text.
  String get text => _element.text;

  set text(String value) {
    _element.text = value;
  }

  /// Adds a [className] to the block.
  void addClass(String className) => _element.addClass(className);
}

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

    _element.removeClass('open');
  }

  /// Opens the modal window.
  void open() {
    _element.addClass('open');
  }
}
