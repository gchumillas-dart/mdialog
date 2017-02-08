import 'package:domelement/core.dart';
import 'package:modal_dialog/src/modal_block.dart';
import 'package:modal_dialog/src/modal_window.dart';

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
