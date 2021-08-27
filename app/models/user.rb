class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :toilets, dependent: :destroy
  # has_many :toilets, through: :bookings
  has_many :bookings, dependent: :destroy
  has_one_attached :profile_photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
