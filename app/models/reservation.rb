class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :reservation_date, presence: true
  validate :validate_reservation_date_format

  validates :city, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :car_id, presence: true, numericality: { only_integer: true }

  private

  def validate_reservation_date_format
    return if reservation_date.blank? || reservation_date.is_a?(Date)

    errors.add(:reservation_date, 'must be a valid date')
  end
end
