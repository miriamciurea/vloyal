import { Controller } from "@hotwired/stimulus"
import { BrowserQRCodeReader } from '@zxing/library';

// Connects to data-controller="basic-qr-code-reader"
export default class extends Controller {
  static targets = ["result"]

  connect() {
    console.log("hello this is working")
    this.codeReader = new BrowserQRCodeReader();
    console.log(this.codeReader)
    this.codeReader
    .decodeFromInputVideoDevice(undefined, 'video')
    .then((result) => {
    // process the result
    console.log(result.text)

    this.resultTarget.textContent = result.text
  })
  .catch(err => console.error(err));
  }
}
