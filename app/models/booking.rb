class Booking < ApplicationRecord
  belongs_to :toilet
  belongs_to :user

  validates :start_time, presence: true
  validates :duration, inclusion: 5..45, presence: true
  validates :start_time, :end_time, presence: true
end
