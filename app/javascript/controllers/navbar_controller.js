import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['menu']

  connect() {
    this.open = false
  }

  toggleMenu() {
    if (this.open) {
      this.menuTarget.classList.remove('open');
      setTimeout(() => {
        this.menuTarget.classList.add('d-none');
      }, 300);
    } else {
      this.menuTarget.classList.remove('d-none');
      setTimeout(() => {
        this.menuTarget.classList.add('open');
      }, 10);
    }
    this.open = !this.open
  }
}
