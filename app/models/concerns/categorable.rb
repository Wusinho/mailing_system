module Categorable
  extend ActiveSupport::Concern

  QUESTION_CATEGORIES = [:coupon_subscription, :other_category]
end