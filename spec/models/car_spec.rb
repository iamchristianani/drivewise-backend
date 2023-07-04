require 'rails_helper'

RSpec.describe 'Car', type: :model do
  describe 'associations' do
    it 'has many reservations' do
      car = Car.reflect_on_association(:reservations)
      expect(car.macro).to eq(:has_many)
    end

    it 'has many users' do
      car = Car.reflect_on_association(:users)
      expect(car.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    before(:each) do
      @car = Car.new(make: 'testmake', model: 'testmodel', year: 2020, color: 'testcolor', body_type: 'testbodytype', engine_capacity: 2.0, engine_cylinders: 4, turbo: false, horsepower: 200,
                     torque: 200, weight: 2000, drivetrain: 'testdrivetrain', transmission: 'testtransmission', fuel_type: 'testfueltype', doors: 4, seats: 5, mileage: 1000, price: 10_000, description: 'testdescription', image: 'testimage')
    end

    it 'is valid with valid attributes' do
      expect(@car).to be_valid
    end

    it 'is not valid without a make' do
      @car.make = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a model' do
      @car.model = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a year' do
      @car.year = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a color' do
      @car.color = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a body_type' do
      @car.body_type = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without an engine_capacity' do
      @car.engine_capacity = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without an engine_cylinders' do
      @car.engine_cylinders = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a turbo' do
      @car.turbo = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a horsepower' do
      @car.horsepower = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a torque' do
      @car.torque = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a weight' do
      @car.weight = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a drivetrain' do
      @car.drivetrain = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a transmission' do
      @car.transmission = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a fuel_type' do
      @car.fuel_type = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a doors' do
      @car.doors = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a seats' do
      @car.seats = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a mileage' do
      @car.mileage = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a price' do
      @car.price = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without a description' do
      @car.description = nil
      expect(@car).to_not be_valid
    end

    it 'is not valid without an image' do
      @car.image = nil
      expect(@car).to_not be_valid
    end
  end
end
