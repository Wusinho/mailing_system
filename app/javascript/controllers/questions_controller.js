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

    fetch(`/questions`, {
      method: 'Post',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrtToken
      },
      body: JSON.stringify({ questions: params })
    }).then(r => r.text())
        .then(html =>{
          console.log(html)
        } )

  }

  buildAnswersObject(inputs, survey_id) {
    let answers = {};
    Object.keys(inputs).forEach(function(key) {
      let input = inputs[key]
      answers[input.id] = { id: input.id, answer: input.value, survey_id: survey_id };
    });

    return { "answers_attributes": answers };
  }



}
