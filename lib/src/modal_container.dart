part of modal_dialog.src;

class ModalContainer {
  final ModalWindow _modalWindow;
  DomElement _element;

  ModalContainer(this._modalWindow) {
    _element = $('<div />')
      ..addClass('modal-window-container')
      ..addTo(_modalWindow.element);
  }

  DomElement get element => _element;
}
