FactoryBot.define do
  factory :survey_answer do
    answer { "MyString" }
    survey
    question
  end
end
