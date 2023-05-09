require 'rails_helper'

RSpec.describe 'Reservation', type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      reservation = Reservation.reflect_on_association(:user)
      expect(reservation.macro).to eq(:belongs_to)
    end

    it 'belongs to a car' do
      reservation = Reservation.reflect_on_association(:car)
      expect(reservation.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    before(:each) do
      @reservation = FactoryBot.create(:reservation)
    end

    it 'is valid with valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'is not valid without a reservation date' do
      @reservation.reservation_date = nil
      expect(@reservation).to_not be_valid
    end

    it 'is not valid without a city' do
      @reservation.city = nil
      expect(@reservation).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @reservation.user_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'is not valid without a car_id' do
      @reservation.car_id = nil
      expect(@reservation).to_not be_valid
    end
  end
end
