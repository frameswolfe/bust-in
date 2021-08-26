class Booking < ApplicationRecord
  belongs_to :toilet
  belongs_to :user

  validates :start_time, presence: true
end
