import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questions"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  change(e) {
    console.log(e.target)
  }
}
