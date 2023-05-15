class Question < ApplicationRecord
  has_many :survey_answers
  has_many :survey_questions
  validates_presence_of :question_type, :question, :category_type
  accepts_nested_attributes_for :survey_answers, allow_destroy: true
  enum question_type: { single_choice: 0, long_answer: 1 }

end
