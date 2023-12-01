import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geocoding"
export default class extends Controller {
  static targets = ['location', 'list', "input", "form", 'loading', 'listCont']
  static values = {
    location: Array
  }

  connect() {
    // console.log('getting location')
    console.log(this.locationValue);
    this.locationSet = this.locationValue.length > 0
    this.getLocation();
  }

  getLocation() {
    if (this.locationSet) {
      console.log('--- location already set, showing list ---')
      this.loadingTarget.classList.add('away')
      this.loadingTarget.classList.add('d-none')
      this.listContTarget.classList.remove('hidden')
    }
    else if (navigator.geolocation) {
      console.log('--- no location set, updating/setting user location and retreiving list ---')
      navigator.geolocation.getCurrentPosition(
        this.showPosition.bind(this),
        this.showError.bind(this)
      );
    } else {
      this.showError({ message: "Geolocation is not supported by this browser." });
    }
  }

  showPosition(position) {
    // this.locationTarget.innerHTML = `Latitude: ${position.coords.latitude}<br>Longitude: ${position.coords.longitude}`;

    // Make an AJAX request to the Rails controller to update the @user_location variable
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const userLocation = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    }
    fetch("/set_user_location", {
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
        this.loadingTarget.classList.add('d-none')
        this.listContTarget.classList.remove('hidden')
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
