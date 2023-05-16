FactoryBot.define do
  factory :survey do
    category { 'coupon_subscription' }
    completed { false }
    subscription
  end
end

