# FactoryBot.define do
#   factory :survey do
#     category { 'coupon_subscription' }
#     completed { false }
#     subscription
#   end
# end


# spec/factories/surveys.rb
FactoryBot.define do
  factory :survey do
    # Define attributes for the survey factory

        category { 'coupon_subscription' }
        completed { false }
        subscription

    trait :with_questions do
      after(:create) do |survey|
        create_list(:question, 3, survey: survey)
      end
    end
  end
end

#
# # spec/factories/questions.rb
# FactoryBot.define do
#   factory :question do
#     content { 'Some question' }
#     # Add any other attributes needed for the Question model
#   end
# end
