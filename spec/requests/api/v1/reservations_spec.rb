require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @car = FactoryBot.create(:car)
  end

  path '/api/v1/reservations' do
    get('list all reservations') do
      tags 'Reservations'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:id) { Reservation.create(reservation_params(car_id: @car.id, user_id: @user.id)).id }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list user\'s reservations') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:user_id) { @user.id }
        run_test!
      end
    end

    post('create reservation') do
      parameter name: 'car_id', in: :path, type: :string, description: 'car_id'
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation_date: { type: :string, example: Faker::Date.between(from: '2023-05-19', to: '2023-12-31') },
          city: { type: :string, example: Faker::Address.city }
        },
        required: %w[reservation_date city car_id user_id]
      }
      response(201, 'successful') do
        let(:car_id) { @car.id }
        let(:user_id) { @user.id }
        let(:reservation) { reservation_params(car_id: @car.id, user_id: @user.id) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:user_id) { @user.id }
        let(:id) { Reservation.create(reservation_params(car_id: @car.id, user_id: @user.id)).id }

        run_test!
      end
    end

    patch('update reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city: { type: :string, example: Faker::Address.city }
        },
        required: %w[city]
      }
      response(200, 'successful') do
        let(:user_id) { @user.id }
        let(:id) { Reservation.create(reservation_params(car_id: @car.id, user_id: @user.id)).id }
        let(:reservation) { { city: Faker::Address.city } }
        run_test!
      end
    end

    delete('delete reservation') do
      tags 'Reservations'
      response(204, 'no content') do
        let(:user_id) { @user.id }
        let(:id) { Reservation.create(reservation_params(car_id: @car.id, user_id: @user.id)).id }
        run_test!
      end
    end
  end

  def reservation_params(car_id: nil, user_id: nil)
    {
      reservation_date: Faker::Date.between(from: '2023-05-19', to: '2023-12-31'),
      city: Faker::Address.city,
      car_id: car_id,
      user_id: user_id
    }
  end
end
