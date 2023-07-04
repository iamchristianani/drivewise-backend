class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }
  validates :color, presence: true
  validates :body_type, presence: true
  validates :engine_capacity, presence: true, numericality: true
  validates :engine_cylinders, presence: true, numericality: { only_integer: true }
  validates :turbo, inclusion: { in: [true, false] }
  validates :horsepower, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :torque, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :drivetrain, presence: true
  validates :transmission, presence: true
  validates :fuel_type, presence: true
  validates :doors, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :image, presence: true
end
