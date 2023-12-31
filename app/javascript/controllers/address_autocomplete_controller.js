import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { key: String }

  static targets = ["address"]

  connect() {
    console.log(this.keyValue);
    this.geocoder = new MapboxGeocoder({
      accessToken: this.keyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
    console.log('pls work');
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
