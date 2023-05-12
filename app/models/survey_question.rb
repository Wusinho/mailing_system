class SurverQuestion < ApplicationRecord
  belongs_to :survey
  belongs_to :question
end
