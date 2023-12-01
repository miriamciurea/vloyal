import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'


// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    // console.log("Hello from Map Stimulas!");
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.#addMarkerToMap();
    this.#fitMapToMarker();

  }

  #addMarkerToMap() {

    this.markersValue.forEach(marker => {
      const popup = new mapboxgl.Popup({ closeOnClick: false }).setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      // .setLngLat([marker.lng, marker.lat])
      // .setHTML(marker.info_window_html)
      // .addTo(this.map);
      // popup._container.style.top = '-50px';
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()

    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 150 })
  }
}
