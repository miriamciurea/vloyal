import { Controller } from "@hotwired/stimulus"
import { BrowserQRCodeReader } from '@zxing/library';

// Connects to data-controller="basic-qr-code-reader"
export default class extends Controller {
  static targets = ["resultContainer", "alert", "card"]
  static values = {
    user: Number
  }

  connect() {
    // console.log("hello this is working")
    this.codeReader = new BrowserQRCodeReader();
    // console.log(this.codeReader)
    this.codeReader
    .decodeFromInputVideoDevice(undefined, 'video')
    .then((result) => {
    // process the result
    // console.log(result.text)
    // let qrDataFromReader = result.text;

    // Prepare a post request so it can be sent to the Rails controller
    // Create a new FormData object
    let formData = new FormData();

    // // Prepare the data params
    // let qrCodeParams = {
    //   qr_data: qrDataFromReader
    // };

    // Add the params to the FormData object, making sure to convert it to JSON
    formData.append("user_id", this.userValue);

    // Send the QR code data as JSON to the qr_codes#create action using fetch
    fetch(result.text, {
      method: 'PATCH',
      'content-type': 'application/json',
      body: formData
    })
      .then(response => response.json()).then( data => {
        console.log(data);
        this.resultContainerTarget.classList.remove('d-none')
        this.alertTarget.innerHTML = data.alert
        this.resultContainerTarget.insertAdjacentHTML('beforeend', data.card)
        setTimeout(() => {
          this.resultContainerTarget.classList.add('show')
        }, 10);
        setTimeout(() => {
          this.cardTarget.classList.add('flipped')
        }, 550);
      })
      .catch(error => {
        console.error('Error:', error);
      });

    // this.resultTarget.textContent = result.text
  })
  .catch(err => console.error(err));
  }

  test(e) {
    e.preventDefault()
    let formData = new FormData();

    // // Prepare the data params
    // let qrCodeParams = {
    //   qr_data: qrDataFromReader
    // };

    // Add the params to the FormData object, making sure to convert it to JSON
    formData.append("user_id", this.userValue);

    // Send the QR code data as JSON to the qr_codes#create action using fetch
    fetch('/brands/6', {
      method: 'PATCH',
      'content-type': 'application/json',
      body: formData
    })
      .then(response => response.json()).then( data => {
        console.log(data);
        this.resultContainerTarget.classList.remove('d-none')
        this.alertTarget.innerHTML = data.alert
        this.resultContainerTarget.insertAdjacentHTML('beforeend', data.card)
        setTimeout(() => {
          this.resultContainerTarget.classList.add('show')
        }, 10);
        setTimeout(() => {
          this.cardTarget.classList.add('flipped')
        }, 800);
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }
}
