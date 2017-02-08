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
  ModalBlock _footer;

  ModalDialog(this.title, this.message) {
    modalWindow.close();
    modalWindow.add(new ModalBlock('header')..text = title);
    modalWindow.add(new ModalBlock('body')..text = message);
    modalWindow.add(_footer = new ModalBlock('footer'));
  }

  DomElement addButton(String label) {
    return $('<button type="button" />')
      ..text = label
      ..addTo(_footer.element);
  }
}
