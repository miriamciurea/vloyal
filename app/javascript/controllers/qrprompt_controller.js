import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="prompt"
export default class extends Controller {

  static targets = ["prompt", 'img', 'card']

  connect() {
    console.log('Hello World')
  }

  showPrompt(e) {
    e.preventDefault()
    let targetCard;
    console.log(e);
    console.log(this.cardTargets[0]);
    this.cardTargets.forEach(card => {
      if (card.contains(e.target)) {
        targetCard = card
      }
    });
    console.log(this.imgTarget);
    console.log(targetCard);
    this.imgTarget.src = targetCard.dataset.src

    console.log(e);
    this.promptTarget.classList.remove("d-none")
    setTimeout(() => {
      this.promptTarget.classList.add("show")
    }, 10);
  }

  hidePrompt(e) {
    console.log("hide prompt");
    e.preventDefault(e)
    this.promptTarget.classList.remove("show")
    setTimeout(() => {
      this.promptTarget.classList.add("d-none")
    }, 300);
  }
}
