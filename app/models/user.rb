class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :activities
  has_many :bookings
  has_one_attached :photo
  has_many :bookings_as_owner, through: :activities, source: :bookings
end
