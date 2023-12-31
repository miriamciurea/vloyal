import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

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
      style: "mapbox://styles/anupale07/clpqu6p79015w01r5fsby2a0v"
    });
    this.#addMarkerToMap();
    setTimeout(() => {
      this.#fitMapToMarker();
    }, 100);
    // this.map.addControl(new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl
    // }))
    // this.setupMap();
  }

  // setupMap() {
  //   if (geolocation in navigator) {
  //     navigator.geolocation.getCurrentPosition(position => {
  //       const userLocation = [position.coords.longitude, position.coords.latitude];

  //       new mapboxgl.Marker()
  //         .setLngLat(userLocation)
  //         .setPopup(new mapboxgl.Popup({ closeOnClick: true }).setHTML("<h1> You are here </h1>"))
  //         .addTo(this.map);

  //       this.map.setCenter(userLocation);
  //     }, function (error) {
  //       console.log('Error getting location:', error);
  //     });
  //   } else {
  //     console.log('Geolocation is not supported');
  //   }
  // }


  #addMarkerToMap() {

    if (this.markersValue.length > 1) {

      this.markersValue.forEach(marker => {
        const popup = new mapboxgl.Popup({ closeOnClick: true }).setHTML(marker.info_window_html)
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
      })
    } else {
      this.markersValue[0]
      const popup = new mapboxgl.Popup({ closeOnClick: true }).setHTML(this.markersValue[0].info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = this.markersValue[0].marker_html
      // .setLngLat([marker.lng, marker.lat])
      // .setHTML(marker.info_window_html)
      // .addTo(this.map);
      // popup._container.style.top = '-50px';
      const marker = new mapboxgl.Marker(customMarker)
        .setLngLat([this.markersValue[0].lng, this.markersValue[0].lat])
        .setPopup(popup)
        .addTo(this.map);
      marker.togglePopup();
    }
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()

    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 124, maxZoom: 15, duration: 1500 })
  }
}
