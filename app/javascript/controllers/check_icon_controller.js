import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="check-icon"
export default class extends Controller {
  connect() {
    // console.log("HERE I A");
    this.originalHref = this.element.href
    // console.log(this.originalHref)
  }

  flip(e){
    e.preventDefault();
    console.log("hi");
    this.element.querySelector('i').classList.remove('fa-circle-plus');
    this.element.querySelector('i').classList.add('fa-circle-check');

    // this.element.querySelector('i').parentElement.dataset.turboMethod = "";
    if (this.element.href != this.originalHref) {
      console.log("No need to add card");
      return false
    } else {
      let csrfToken = document.querySelector('meta[name="csrf-token"]').content;
      console.log(csrfToken);
      fetch(this.element.href, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": csrfToken
        },
        // mode: 'no-cors',
        body: JSON.stringify({})
      })
        .then((response) => console.log(response));
      this.element.href = "#";
    }
  }
}
