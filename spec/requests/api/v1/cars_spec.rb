require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  path '/api/v1/cars' do
    get('list cars') do
      tags 'Cars'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create car') do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          make: { type: :string, example: Faker::Vehicle.make },
          model: { type: :string, example: Faker::Vehicle.model },
          year: { type: :integer, example: Faker::Vehicle.year },
          color: { type: :string, example: Faker::Vehicle.color },
          body_type: { type: :string, example: Faker::Vehicle.car_type },
          engine_capacity: { type: :integer, example: Faker::Vehicle.engine_size },
          engine_cylinders: { type: :integer, example: Faker::Vehicle.engine },
          turbo: { type: :boolean, example: Faker::Boolean.boolean },
          horsepower: { type: :integer, example: Faker::Number.between(from: 100, to: 1000) },
          torque: { type: :integer, example: Faker::Number.between(from: 100, to: 1000) },
          weight: { type: :integer, example: Faker::Number.between(from: 100, to: 10_000) },
          drivetrain: { type: :string, example: Faker::Vehicle.drive_type },
          transmission: { type: :string, example: Faker::Vehicle.transmission },
          fuel_type: { type: :string, example: Faker::Vehicle.fuel_type },
          doors: { type: :integer, example: Faker::Vehicle.doors },
          seats: { type: :integer, example: Faker::Number.between(from: 2, to: 8) },
          mileage: { type: :integer, example: Faker::Vehicle.mileage },
          price: { type: :integer, example: Faker::Number.decimal(l_digits: 4, r_digits: 2) },
          description: { type: :string, example: Faker::Lorem.paragraph },
          image: { type: :string, example: Faker::Internet.url }
        },
        required: %w[make model year color body_type engine_capacity engine_cylinders turbo horsepower torque weight drivetrain transmission fuel_type doors seats mileage price description image]
      }
      response(201, 'successful') do
        let(:car) { car_params }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show car') do
      tags 'Cars'
      response(200, 'successful') do
        let(:id) { Car.create(car_params).id }
        run_test!
      end
    end

    delete('delete car') do
      tags 'Cars'
      response(200, 'successful') do
        let(:id) { Car.create(car_params).id }
        run_test!
      end
    end
  end

  def car_params
    {
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year: Faker::Vehicle.year,
      color: Faker::Vehicle.color,
      body_type: Faker::Vehicle.car_type,
      engine_capacity: Faker::Vehicle.engine_size,
      engine_cylinders: Faker::Vehicle.engine,
      turbo: Faker::Boolean.boolean,
      horsepower: Faker::Number.between(from: 100, to: 1000),
      torque: Faker::Number.between(from: 100, to: 1000),
      weight: Faker::Number.between(from: 1000, to: 10_000),
      drivetrain: Faker::Vehicle.drive_type,
      transmission: Faker::Vehicle.transmission,
      fuel_type: Faker::Vehicle.fuel_type,
      doors: Faker::Vehicle.doors,
      seats: Faker::Number.between(from: 2, to: 8),
      mileage: Faker::Vehicle.mileage,
      price: Faker::Number.decimal(l_digits: 4, r_digits: 2),
      description: Faker::Lorem.paragraph,
      image: Faker::Internet.url
    }
  end
end
