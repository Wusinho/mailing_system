FactoryBot.define do
  factory :question do
    question { 'Cual es tu edad?' }
    alternatives { (16..99).to_a }
    question_type { 0 }
    category_type { 'coupon_subscription_questions' }
  end
end
