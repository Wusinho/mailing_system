FactoryBot.define do
  factory :survey_answer do
    survey { nil }
    question { nil }
    answer { "MyString" }
  end
end
