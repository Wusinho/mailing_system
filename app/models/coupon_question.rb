class CouponQuestion < ApplicationRecord
  belongs_to :subscription
  belongs_to :question
  validates_presence_of :answer
end
