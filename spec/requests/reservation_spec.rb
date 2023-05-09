require 'rails_helper'

RSpec.describe 'Reservation', type: :request do
  describe 'GET /reservations' do
    it 'returns a successful response' do
      get '/api/v1/reservations'
      expect(response).to be_successful
    end

    it 'renders the index template with all reservations' do
      reservation = FactoryBot.create(:reservation)
      reservation2 = FactoryBot.create(:reservation)
      get '/api/v1/reservations'
      expected_cities = [
        reservation.city,
        reservation2.city
      ]
      parsed_response = JSON.parse(response.body)
      cities = parsed_response.map { |u| u['city'] }
      expect(cities).to include(*expected_cities)
    end
  end

  describe 'GET /reservations/:id' do
    it 'returns a successful response' do
      reservation = FactoryBot.create(:reservation)
      get "/api/v1/reservations/#{reservation.id}"
      expect(response).to be_successful
    end

    it 'renders the show template with the requested reservation' do
      reservation = FactoryBot.create(:reservation)
      get "/api/v1/reservations/#{reservation.id}"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['city']).to eq(reservation.city)
    end
  end

  describe 'POST /users/:user_id/reservations' do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      car = FactoryBot.create(:car)
      reservation_params = {
        reservation_date: '2021-03-25',
        city: 'testcity',
        car_id: car.id,
        user_id: user.id
      }
      post "/api/v1/users/#{user.id}/reservations", params: { reservation: reservation_params }
      expect(response).to be_successful
    end

    it 'renders the create template with the new reservation' do
      user = FactoryBot.create(:user)
      car = FactoryBot.create(:car)
      reservation_params = {
        reservation_date: '2021-03-25',
        city: 'testcity',
        car_id: car.id,
        user_id: user.id
      }
      post "/api/v1/users/#{user.id}/reservations", params: { reservation: reservation_params }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['city']).to eq(reservation_params[:city])
    end
  end

  describe 'PATCH /users/:user_id/reservations/:id' do
    it 'returns a successful response' do
      reservation = FactoryBot.create(:reservation)
      reservation_params = {
        city: 'testcity'
      }
      patch "/api/v1/users/#{reservation.user_id}/reservations/#{reservation.id}", params: { reservation: reservation_params }
      expect(response).to be_successful
    end

    it 'renders the update template with the updated reservation' do
      reservation = FactoryBot.create(:reservation)
      reservation_params = {
        city: 'testcity'
      }
      patch "/api/v1/users/#{reservation.user_id}/reservations/#{reservation.id}", params: { reservation: reservation_params }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(JSON.parse({ 'city' => reservation_params[:city] }.to_json))
    end
  end

  describe 'DELETE /users/:user_id/reservations/:id' do
    it 'returns a successful response' do
      reservation = FactoryBot.create(:reservation)
      delete "/api/v1/users/#{reservation.user_id}/reservations/#{reservation.id}"
      expect(response).to be_successful
    end

    it 'renders the destroy template with the deleted reservation' do
      reservation = FactoryBot.create(:reservation)
      delete "/api/v1/users/#{reservation.user_id}/reservations/#{reservation.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(JSON.parse({ 'errors' => [] }.to_json))
    end
  end
end
