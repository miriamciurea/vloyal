import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['feedback']
  connect() {
    this.feedbackTarget.innerHTML = `${window.innerWidth}px X ${window.innerHeight}px`
  }
}
