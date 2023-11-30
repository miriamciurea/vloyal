import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wallet"
export default class extends Controller {
  connect() {
    this.state = 'wallet'
  }

  flipCard(e) {
    this.state = this.element.classList.contains('focus') ? 'focus' : 'wallet'
    if (this.state === 'wallet') {
      // bring it up
      const card = document.querySelector('.loyalty-card.focus')
      if (card) {
        card.classList.remove('focus');
        card.classList.remove('flipped');
      }
      this.element.classList.add('focus')
      this.state = 'focused'
    } else {
      this.element.classList.toggle('flipped')
    }

  }
}
