import 'package:modal_dialog/src/core.dart' show modalWindow;

import 'modal_dialog.dart';

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
