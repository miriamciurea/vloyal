import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ['menu', 'item', 'items']
  connect() {
    this.menu = []
  }

  newItem(e) {
    e.preventDefault()
    console.log('test');
    this.itemsTarget.insertAdjacentHTML('beforeend', `  <div class="item-group" data-menu-target='item'>
    <div class='w-100'>
      <label for="name" class='form-label m-1'>Item Name:</label>
      <input class='form-control m-1' type="text" name='name' data-action='change->menu#processItems'>
    </div>
    <div class='w-100'>
      <label for="price" class='form-label m-1'>Item Price (£):</label>
      <input class='form-control m-1' type="text" name='price' data-action='change->menu#processItems'>
    </div>
  </div>`)
  }

  processItems() {
    console.log(this.itemTargets);
    this.menu = []
    this.itemTargets.forEach(element => {
      const inputs = element.querySelectorAll('input')
      if (inputs[0].value.length > 0 && inputs[1].value.length) {
        const solution = (num) => {
          if (num.split('.')[1] && num.split('.')[1].length >= 2) {
            return num
          } else if (num.split('.')[1]) {
            return `${num}0`
          } else {
            return `${num}.00`
          }
        }
        this.menu.push(`{"name": "${inputs[0].value}", "price": "£${inputs[1].value}"}`)
      }
    });
    this.updateMenu()
  }

  updateMenu() {
    this.menuTarget.value = `[${this.menu.join(',')}]`
  }
}
