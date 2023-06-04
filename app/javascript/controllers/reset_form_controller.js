import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="reset-form"
export default class extends Controller {
	static targets = ['required']

	reset() {
		if (!this.requiredTargets) return;

		const valuesArr = this.requiredTargets.map((field) => field.value);
		if (valuesArr.some((element) => element === "")) return;

    this.element.reset();
  }
}