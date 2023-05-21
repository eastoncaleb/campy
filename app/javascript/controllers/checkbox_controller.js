import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
		connect() {
			this.timerId = 0;
		}

		toggle(e) {
			const alert = document.querySelector("#toast-simple");
			const id = e.target.dataset.id
			const type = e.target.dataset.type
			const csrfToken = document.querySelector("[name='csrf-token']").content

			fetch(`/${type}/${id}/toggle`, {
					method: 'POST', // *GET, POST, PUT, DELETE, etc.
					mode: 'cors', // no-cors, *cors, same-origin
					cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
					credentials: 'same-origin', // include, *same-origin, omit
					headers: {
							'Content-Type': 'application/json',
							'X-CSRF-Token': csrfToken
					},
					body: JSON.stringify({ completed: e.target.checked }) // body data type must match "Content-Type" header
			})
			.then(response => response.json())
			.then(data => {
				clearTimeout(this.timerId);
				
				this.timerId = setTimeout(function(){
					alert.classList.add("hidden")
				}, 3000);

				if(data.status == "Success") {
					alert.querySelector("#message").innerHTML = data.message;
					alert.querySelector("#icon").classList.add("fa-regular", "fa-thumbs-up");
					alert.classList.add("bg-green-500/90")
				} else {
					alert.querySelector("#message").innerHTML = data.message;
					alert.querySelector("#icon").classList.add("fa-regular", "fa-thumbs-down");
					alert.classList.add("bg-red-500/90")
				}
				alert.classList.remove("hidden");
				this._extendTimer(() => alert.classList.add("hidden"), this.timerId, 3000)
		})
	}

	_extendTimer(fn, id, time) {
		clearTimeout(id);
		var id = setTimeout(fn, time);
		this.timerId = id
	}
}
