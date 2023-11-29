import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geocoding"
export default class extends Controller {
  static targets = ['location', 'list', "input", "form", 'loading', 'listCont']

  connect() {
    console.log('getting location')

    this.getLocation();
  }

  getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        this.showPosition.bind(this),
        this.showError.bind(this)
      );
    } else {
      this.showError({ message: "Geolocation is not supported by this browser." });
    }
  }

  showPosition(position) {
    this.locationTarget.innerHTML = `Latitude: ${position.coords.latitude}<br>Longitude: ${position.coords.longitude}`;

    // Make an AJAX request to the Rails controller to update the @user_location variable
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const userLocation = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };

    console.log('--- calling update_user_location ---')

    fetch("/update_user_location", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/plain",
        "X-CSRF-Token": csrfToken
      },
      body: JSON.stringify({ user_location: userLocation })
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.loadingTarget.classList.add('away')
        setTimeout(() => {
          this.loadingTarget.classList.add('d-none')
          this.listContTarget.classList.remove('hidden')
        }, 300);
        this.listTarget.innerHTML = data
      })
  }

  showError(error) {
    this.element.innerHTML = `Error: ${error.message}`;
  }


  search() {
    if (this.inputTarget.value !== '') {
      fetch(`${this.formTarget.action}?query=${this.inputTarget.value}`, {
        headers: { accept: "text/plain" },
      })
        .then((response) => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        });
    } else {
      fetch(`${this.formTarget.action}`, {
        headers: { accept: "text/plain" },
      })
        .then((response) => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        });
    }
  }
}
