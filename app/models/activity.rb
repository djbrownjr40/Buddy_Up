class Activity < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :location, :hourly_rate, :description, presence: true
  has_one_attached :photo
end
