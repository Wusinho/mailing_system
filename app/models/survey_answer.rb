class SurveyAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :question
  validates_presence_of :answer
end
