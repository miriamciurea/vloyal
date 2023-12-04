import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="prompt"
export default class extends Controller {

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
}
