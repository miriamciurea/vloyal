import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geocoding"
export default class extends Controller {
  connect() {
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
    this.element.innerHTML = `Latitude: ${position.coords.latitude}<br>Longitude: ${position.coords.longitude}`;
  }

  showError(error) {
    this.element.innerHTML = `Error: ${error.message}`;
  }
}
