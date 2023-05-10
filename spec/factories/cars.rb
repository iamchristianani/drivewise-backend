require 'faker'

FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    color { Faker::Vehicle.color }
    body_type { Faker::Vehicle.car_type }
    engine_capacity { Faker::Vehicle.engine_size }
    engine_cylinders { Faker::Vehicle.engine }
    turbo { Faker::Boolean.boolean }
    horsepower { Faker::Number.between(from: 100, to: 1000) }
    torque { Faker::Number.between(from: 100, to: 1000) }
    weight { Faker::Number.between(from: 1000, to: 10_000) }
    drivetrain { Faker::Vehicle.drive_type }
    transmission { Faker::Vehicle.transmission }
    fuel_type { Faker::Vehicle.fuel_type }
    doors { Faker::Vehicle.doors }
    seats { Faker::Number.between(from: 2, to: 8) }
    mileage { Faker::Vehicle.mileage }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    description { Faker::Vehicle.standard_specs }
    image { Faker::Internet.url }
  end
end
