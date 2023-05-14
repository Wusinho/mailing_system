module SurveysHelper

  def render_question_form(form)
    t = translation(form)
    if form.object.question.question_type == 'long_answer'
      form.label(t) +
        form.text_field(:answer) +
        form.hidden_field(:question_id, value: form.object.question.id)
    else
      at = alternatives_translation(form)
      form.label(t) +
        form.select(:answer, at, {}) +
        form.hidden_field(:question_id, value: form.object.question.id)
    end
  end

  def translation(form)
    return form.object.question.question if default_language?

    t("questions.#{form.object.question.id}.question")
  end

  def alternatives_translation(form)
    if !default_language? && !number?(form.object.question.alternatives[0])
      t("questions.#{form.object.question.id}.alternatives").split(' ')
    else
      form.object.question.alternatives
    end
  end

  def number?(str)
    Integer(str) rescue false
  end

  def default_language?
    I18n.locale == I18n.default_locale
  end

end
