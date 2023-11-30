import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="prompt"
export default class extends Controller {
  static values = {
    path: String
  }
  static targets = ["prompt"]

  connect() {
    console.log('Hello World')
  }

  showPrompt(e) {
    e.preventDefault()
    this.promptTarget.classList.remove("d-none")
    setTimeout(() => {
      this.promptTarget.classList.add("show")
    }, 10);
  }

  business() {
    window.location.href = this.pathValue + "?business=true";
  }

  client() {
    window.location.href = this.pathValue;
  }
}
