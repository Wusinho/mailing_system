info_basica = 'informacion basica'
info_satisfaccion = 'satisfacción'
info_interes = 'interés'
type = 'coupon_question'

  Question.create(question: 'Cual es tu edad?', alternatives: [16-99], question_type: info_basica, category_type: type)
  Question.create(question: 'Cual es tu nivel educativo?', alternatives: %w[primaria secundaria preparatoria universidad otros ninguna], question_type: info_basica, category_type: type)
  Question.create(question: 'Cómo calificarías tu experiencia en nuestro sitio web?', alternatives: %w[mala buena excelente], question_type: info_satisfaccion, category_type: type)
  Question.create(question: 'Recomendarías nuestro sitio web a alguien más?', alternatives: %w[si no], question_type: info_satisfaccion, category_type: type)
  Question.create(question: 'Con que frequencia visitas nuestro sitio web?', question_type: info_interes, category_type: type)
  Question.create(question: 'Qué temas te gustaría que cubriéramos en nuestro sitio web?', question_type: info_interes, category_type: type)
