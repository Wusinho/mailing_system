FactoryBot.define do
  factory :subscription do
    email { Faker::Internet.email }
    preferences { [['men', 'women'].sample] }
  end
end
