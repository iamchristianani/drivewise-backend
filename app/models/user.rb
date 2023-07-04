class User < ApplicationRecord
  has_many :reservations
  has_many :cars, through: :reservations

  validates :username, presence: true, length: { minimum: 3 }
end
