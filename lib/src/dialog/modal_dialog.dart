import 'package:domelement/core.dart';
import 'package:modal_dialog/src/modal_block.dart';
import 'package:modal_dialog/src/modal_window.dart';

class ModalDialog {
  final String title;
  final String message;
  ModalWindow _modalWindow;
  ModalBlock _footer;

  ModalDialog(this.title, this.message) {
    _modalWindow = new ModalWindow();
    _modalWindow.add(new ModalBlock('header')..text = title);
    _modalWindow.add(new ModalBlock('body')..text = message);
    _modalWindow.add(_footer = new ModalBlock('footer'));
  }

  ModalWindow get modalWindow => _modalWindow;

  DomElement addButton(String label) {
    return $('<button type="button" />')
      ..text = label
      ..addTo(_footer.element);
  }
}
