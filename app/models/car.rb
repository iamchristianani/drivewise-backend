class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, length: { maximum: 4 }
  validates :color, presence: true
  validates :body_type, presence: true
  validates :engine_capacity, presence: true
  validates :engine_cylinders, presence: true
  validates_inclusion_of :turbo, in: [true, false]
  validates :horsepower, presence: true
  validates :torque, presence: true
  validates :weight, presence: true
  validates :drivetrain, presence: true
  validates :transmission, presence: true
  validates :fuel_type, presence: true
  validates :doors, presence: true
  validates :seats, presence: true
  validates :mileage, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
