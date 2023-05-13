class Survey < ApplicationRecord
  belongs_to :subscription
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  accepts_nested_attributes_for :survey_questions, allow_destroy: true

end
