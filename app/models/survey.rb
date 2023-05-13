class Survey < ApplicationRecord
  belongs_to :subscription
  has_many :survey_questions
  has_many :questions, through: :survey_questions
end
