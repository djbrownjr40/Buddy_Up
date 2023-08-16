class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :start_date, presence: true
  validates :end_date, presence: true

  enum status: { pending: 0, confirmed: 1, rejected: 2 }
end
