class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :reservation_date, presence: true, timeliness: { type: :date }
  validates :city, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :car_id, presence: true, numericality: { only_integer: true }
end
