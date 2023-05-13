type = 'coupon_subscription_questions'

  Question.create(question: 'Cual es tu edad?', alternatives: (16..99).to_a, question_type: :single_choice, category_type: type)
  Question.create(question: 'Cual es tu nivel educativo?', alternatives: %w[primaria secundaria preparatoria universidad otros ninguna], question_type: 0, category_type: type)
  Question.create(question: 'Cómo calificarías tu experiencia en nuestro sitio web?', alternatives: %w[mala buena excelente], question_type: 0, category_type: type)
  Question.create(question: 'Recomendarías nuestro sitio web a alguien más?', alternatives: %w[si no], question_type: 0, category_type: type)
  Question.create(question: 'Con que frequencia visitas nuestro sitio web?', question_type: 1, category_type: type)
  Question.create(question: 'Qué temas te gustaría que cubriéramos en nuestro sitio web?', question_type: 1, category_type: type)
