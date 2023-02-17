import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['like']

  like() {
    fetch(this.likeTarget.href, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
  }
}