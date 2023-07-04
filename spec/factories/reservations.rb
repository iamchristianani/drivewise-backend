require 'faker'

FactoryBot.define do
  factory :reservation do
    reservation_date { Faker::Date.between(from: '2023-05-20', to: '2023-12-31') }
    city { Faker::Address.city }
    user
    car
  end
end
