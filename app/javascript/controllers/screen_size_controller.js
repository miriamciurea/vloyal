import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['feedback']
  connect() {
    this.feedbackTarget.innerHTML = `${window.outerWidth}px X ${window.outerHeight}px`
  }
}
