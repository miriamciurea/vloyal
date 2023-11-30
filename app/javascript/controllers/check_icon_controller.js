import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="check-icon"
export default class extends Controller {
  connect() {
    console.log("HERE I AM");
    this.originalHref = this.element.href
    console.log(this.originalHref)
  }

  flip(e){
    e.preventDefault();
    console.log("hi");
    this.element.querySelector('i').classList.remove('fa-regular');
    this.element.querySelector('i').classList.add('fa-solid');

    // this.element.querySelector('i').parentElement.dataset.turboMethod = "";
    if (this.element.href != this.originalHref) {
      console.log("No need to add card");
      return false
    } else {
      let csrfToken = document.querySelector('meta[name="csrf-token"]').content;
      fetch(this.element.href, {
        method: "POST",
        headers: {
          // "Content-Type": "application/json",
          // "Accept": "text/plain",
          "X-CSRF-Token": csrfToken
        }
      })
        .then((response) => console.log(response));
      this.element.href = "#";
    }
  }
}
