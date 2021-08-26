class Toilet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :location, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cost_per_minute, presence: true, numericality: { only_integer: true }
  validates :access_info, presence: true
end
