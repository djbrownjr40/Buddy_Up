class Review < ApplicationRecord
  belongs_to :user

  validates :ratings, inclusion: { in: (0..5) }
  validates :comment, presence: true, length: { minimum: 3 }
end
