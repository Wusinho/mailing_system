import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="error-message"
export default class extends Controller {
  connect() {
  }

  close_error_message(e){
    e.preventDefault()
    e.target.parentElement.innerHTML = ''
  }
}
