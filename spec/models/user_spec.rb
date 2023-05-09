
require 'rails_helper'

RSpec.describe 'User', type: :model do 
  describe 'associations' do
    it 'has many cars' do
      user = User.reflect_on_association(:cars)
      expect(user.macro).to eq(:has_many)
   end

    it 'has many reservations' do
      user = User.reflect_on_association(:reservations)
      expect(user.macro).to eq(:has_many)
    end
 end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(username: 'testuser')
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user = User.new(username: nil)
      expect(user).to_not be_valid
    end
  end

  
end