import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wallet"
export default class extends Controller {
  static targets = ['card']
  connect() {
    this.state = 'wallet'
    console.log(this.cardTargets)
  }

  flipCard(e) {
    console.log(e)
    console.log(e.currentTarget.classList)
    // if (e.currentTarget.classList.contains('focus')) {
    //   if (e.currentTarget.classList.contains('flipped')) {
    //     console.log("removing flipped")
    //     e.currentTarget.classList.remove('flipped')
    //   } else {
    //     console.log("add flipped")
    //     e.currentTarget.classList.add('flipped')
    //   }
    // }
    if (e.currentTarget.classList.contains("focus") || e.currentTarget.classList.contains("flipped")) {
      e.currentTarget.classList.remove("flipped")
      // sleep(50).then(() => { currentTarget.classList.remove("focus"); });
      e.currentTarget.classList.remove("focus")

    } else {
      e.currentTarget.classList.add("focus");
      e.currentTarget.classList.add("flipped");
    }




    this.cardTargets.forEach((card) => {
      // console.log(card);
      // console.log(e.currentTarget);
      // console.log(card == e.currentTarget);
      if (card != e.currentTarget) {
        card.classList.remove('flipped');
        card.classList.remove('focus');
      }

    });

    // this.state = this.element.classList.contains('focus') ? 'focus' : 'wallet'
    // if (this.state === 'wallet') {
    //   // bring it up
    //   const card = document.querySelector('.loyalty-card.focus')
    //   if (card) {
    //     card.classList.remove('focus');
    //     card.classList.remove('flipped');
    //   }
    //   this.element.classList.add('focus')
    //   this.state = 'focused'
    // } else {
    //   this.element.classList.toggle('flipped')
    // }

  }

  reset(e) {
    let target = e.target;
    while (target != this.element) {
      target = target.parentElement;
      if (this.cardTargets.indexOf(target) != -1 ) {
        return false
      }
    }
    this.cardTargets.forEach((card) => {
      card.classList.remove('flipped');
      card.classList.remove('focus');
    });
  }
}
