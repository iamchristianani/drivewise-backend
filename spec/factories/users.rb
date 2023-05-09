require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
  end
end
