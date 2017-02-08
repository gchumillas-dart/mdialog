part of modal_dialog.src;

class ModalBlock {
  DomElement _element;

  ModalBlock() {
    _element = $('<div class="modal-window-block" />');
  }

  DomElement get element => _element;
}
