FactoryBot.define do
  factory :question do
    question { 'Cual es tu edad?' }
    alternatives { (16..99).to_a }
    question_type { :single_choice }
    category_type { 1 }
  end
end
