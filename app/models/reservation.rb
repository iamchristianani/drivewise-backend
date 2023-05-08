class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :reservation_date, presence: true
  validates :city, presence: true
  validates :user_id, presence: true
  validates :car_id, presence: true
end
