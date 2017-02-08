part of modal_dialog.src;

class ModalAlert extends ModalDialog {
  ModalAlert(String title, String message, {Function accept})
      : super(title, message) {
    modalWindow.container.addClass('alert');

    final acceptBtn = addButton('Accept');
    if (accept != null) {
      acceptBtn.on('click', accept);
    }
  }
}

class ModalConfirm extends ModalAlert {
  ModalConfirm(String title, String message, {Function accept, Function cancel})
      : super(title, message, accept: accept) {
    modalWindow.container.addClass('confirm');

    final cancelBtn = addButton('Cancel');
    if (cancel != null) {
      cancelBtn.on('click', cancel);
    }
  }
}

class ModalDialog {
  final String title;
  final String message;
  DomElement _footer;

  ModalDialog(this.title, this.message) {
    modalWindow.close();

    final header = new ModalBlock('header');
    header.element.text = title;
    modalWindow.add(header);

    final body = new ModalBlock('body');
    body.element.text = message;
    modalWindow.add(body);

    final footer = new ModalBlock('footer');
    _footer = footer.element;
    modalWindow.add(footer);
  }

  DomElement addButton(String label) {
    return $('<button type="button" />')
      ..text = label
      ..addTo(_footer);
  }

  void close() {}
}
