part of modal_dialog.src;

class ModalAlert extends ModalDialog {
  ModalAlert(ModalWindow modal, String title, String message, {Function accept})
      : super(modal, title, message) {
    _modalWindow.container.addClass('alert');

    final acceptBtn = addButton('Accept');
    if (accept != null) {
      acceptBtn.on('click', accept);
    }
  }
}

class ModalConfirm extends ModalAlert {
  ModalConfirm(ModalWindow modal, String title, String message,
      {Function accept, Function cancel})
      : super(modal, title, message, accept: accept) {
    _modalWindow.container.addClass('confirm');

    final cancelBtn = addButton('Cancel');
    if (cancel != null) {
      cancelBtn.on('click', cancel);
    }
  }
}

class ModalDialog {
  final ModalWindow _modalWindow;
  final String title;
  final String message;
  DomElement _footer;

  ModalDialog(this._modalWindow, this.title, this.message) {
    final header = new ModalBlock();
    header.element
      ..addClass('header')
      ..text = title;
    _modalWindow.add(header);

    final body = new ModalBlock();
    body.element
      ..addClass('body')
      ..text = message;
    _modalWindow.add(body);

    final footer = new ModalBlock();
    _footer = footer.element;
    _footer.addClass('footer');
    _modalWindow.add(footer);
  }

  DomElement addButton(String label) {
    return $('<button type="button" />')
      ..text = label
      ..addTo(_footer);
  }

  void close() {}
}
