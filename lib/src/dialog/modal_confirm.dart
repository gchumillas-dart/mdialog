import 'package:modal_dialog/src/core.dart' show modalWindow;

import 'modal_alert.dart';

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
