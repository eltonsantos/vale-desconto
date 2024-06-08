// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap";

export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element, {
      keyboard: false,
    });
    this.modal.show();

    document.addEventListener("turbo:visit", () => {
      if (this.isOpen()) {
        this.modal.hide();
      }
    });
  }

  hideBeforeRender(event) {
    if (this.isOpen()) {
      event.preventDefault();
      this.element.addEventListener("hidden.bs.modal", event.detail.resume);
      this.modal.hide();
    }
  }

  isOpen() {
    return this.element.classList.contains("show");
  }

  disconnect() {
    this.modal.hide();
  }
}
