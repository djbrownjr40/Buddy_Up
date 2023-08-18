class Activity < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  has_one_attached :photo

  validates :location, :hourly_rate, :description, presence: true

  def average_rating
    return 0 if reviews.nil? || reviews.empty?

    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    sum / reviews.length
  end
end
