import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    const node = this.element;
		this._hideAfterTimeout(node)
  }

	_hideAfterTimeout(node) {
		setTimeout(function(){
			node.classList.add("hidden")
		}, 3000);
	}
}
