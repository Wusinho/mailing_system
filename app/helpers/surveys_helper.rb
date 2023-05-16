module SurveysHelper

  def render_question_form(form)
    t = translation(form)
    numbering = (form.index + 1).to_s
    label_number = "#{numbering}- #{t}"
    question = form.object.question
    question_type = question.question_type

    content_tag(:div, class: "form-group mb-3") do
      concat form.label(label_number, class: "mb-3")
      if question_type == 'long_answer'
        concat form.text_field(:answer, class: "form-control")
      else
        at = alternatives_translation(form)
        concat form.select(:answer, at, {}, class: "form-control")
      end
      concat form.hidden_field(:question_id, value: question.id)
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
