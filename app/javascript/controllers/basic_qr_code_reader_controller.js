import { Controller } from "@hotwired/stimulus"
import { BrowserQRCodeReader } from '@zxing/library';

// Connects to data-controller="basic-qr-code-reader"
export default class extends Controller {
  static targets = ["result"]

  connect() {
    // console.log("hello this is working")
    this.codeReader = new BrowserQRCodeReader();
    // console.log(this.codeReader)
    this.codeReader
    .decodeFromInputVideoDevice(undefined, 'video')
    .then((result) => {
    // process the result
    // console.log(result.text)
    let qrDataFromReader = result.text;

    // Prepare a post request so it can be sent to the Rails controller
    // Create a new FormData object
    let formData = new FormData();

    // Prepare the data params
    let qrCodeParams = {
      qr_data: qrDataFromReader
    };

    // Add the params to the FormData object, making sure to convert it to JSON
    formData.append("qr_code_json_data", JSON.stringify(qrCodeParams));

    // Send the QR code data as JSON to the qr_codes#create action using fetch
    fetch('/basic_qr_codes', {
      method: 'POST',
      body: formData
    })
      .then(response => {
        // Handle the response here if needed
        console.log(response)
      })
      .catch(error => {
        console.error('Error:', error);
      });

    // this.resultTarget.textContent = result.text
  })
  .catch(err => console.error(err));
  }
}
