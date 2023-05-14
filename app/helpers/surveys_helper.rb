module SurveysHelper

  def render_question_form(form)
    if form.object.question.question_type == 'long_answer'
      form.label(form.object.question.question) +
        form.text_field(:answer) +
        form.hidden_field(:question_id, value: form.object.question.id)
    else
      form.label(form.object.question.question) +
        form.select(:answer, form.object.question.alternatives, {}) +
        form.hidden_field(:question_id, value: form.object.question.id)
    end
  end

end
