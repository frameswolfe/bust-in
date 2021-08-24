class Booking < ApplicationRecord
  belongs_to :toilet
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true, numericality: { only_integer: true }
end
