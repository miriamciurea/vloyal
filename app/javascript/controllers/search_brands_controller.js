import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-brands"
export default class extends Controller {
  static targets = ["input", "list", "form"];
  connect() {}

  search() {
    if (this.inputTarget.value !== '') {
      fetch(`${this.formTarget.action}?query=${this.inputTarget.value}`, {
        headers: { accept: "text/plain" },
      })
        .then((response) => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        });
    } else {
      fetch(`${this.formTarget.action}`, {
        headers: { accept: "text/plain" },
      })
        .then((response) => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        });
    }
  }
}
