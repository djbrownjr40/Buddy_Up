class Activity < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :location, :hourly_rate, :description, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
