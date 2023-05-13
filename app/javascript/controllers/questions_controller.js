import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form']

  connect() {
  }


  change(e) {
  }

  submit(e) {
    e.preventDefault()
    const surver_id = e.target.dataset.surveyId
    let inputs = document.getElementsByClassName('answer_input')
    let params = this.buildAnswersObject(inputs)
    console.log(params)

  }

  buildAnswersObject(inputs) {
    let answers = {};
    Object.keys(inputs).forEach(function(key) {
      let input = inputs[key]
      answers[input.id] = { id: input.id, answer: input.value };
    });

    return { "question": { "answers_attributes": answers } };
  }



}
