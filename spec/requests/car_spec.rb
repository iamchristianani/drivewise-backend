require 'rails_helper'

RSpec.describe 'Car', type: :request do
  before(:each) do
    @car = Car.create(make: 'testmake', model: 'testmodel', year: 'testyear', color: 'testcolor', body_type: 'testbody_type', engine_capacity: 'testengine_capacity',
                      engine_cylinders: 'testengine_cylinders', turbo: 'testturbo', horsepower: 'testhorsepower', torque: 'testtorque', weight: 'testweight', drivetrain: 'testdrivetrain', transmission: 'testtransmission', fuel_type: 'testfuel_type', doors: 'testdoors', seats: 'testseats', mileage: 'testmileage', price: 'testprice', description: 'testdescription', image: 'testimage')
    @car2 = Car.create(make: 'testmake2', model: 'testmodel2', year: 'testyear2', color: 'testcolor2', body_type: 'testbody_type2', engine_capacity: 'testengine_capacity2',
                       engine_cylinders: 'testengine_cylinders2', turbo: 'testturbo2', horsepower: 'testhorsepower2', torque: 'testtorque2', weight: 'testweight2', drivetrain: 'testdrivetrain2', transmission: 'testtransmission2', fuel_type: 'testfuel_type2', doors: 'testdoors2', seats: 'testseats2', mileage: 'testmileage2', price: 'testprice2', description: 'testdescription2', image: 'testimage2')
  end

  describe 'GET /cars' do
    it 'returns a successful response' do
      get '/api/v1/cars'
      expect(response).to be_successful
    end

    it 'renders the index template with all cars' do
      get '/api/v1/cars'
      expected_cars = JSON.parse(response.body)
      expect(expected_cars.length).to eq(2)
    end

    it 'renders the show template with the car' do
      get "/api/v1/cars/#{@car.id}"
      expected_car = JSON.parse(response.body)
      expect(expected_car['make']).to eq('testmake')
      expect(expected_car['model']).to eq('testmodel')
      expect(expected_car['year']).to eq(0)
      expect(expected_car['color']).to eq('testcolor')
    end

    it 'renders the new template with the car' do
      get "/api/v1/cars/#{@car2.id}"
      expected_car = JSON.parse(response.body)
      expect(expected_car['make']).to eq('testmake2')
      expect(expected_car['model']).to eq('testmodel2')
      expect(expected_car['year']).to eq(0)
      expect(expected_car['color']).to eq('testcolor2')
    end

    it 'renders the delete template with the car' do
      delete "/api/v1/cars/#{@car2.id}"
      expect(response).to have_http_status(200)
      expect(Car.count).to eq(1)
    end
  end
end
