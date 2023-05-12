class CouponQuestion < ApplicationRecord
  belongs_to :cupon_survey
  belongs_to :question
end
