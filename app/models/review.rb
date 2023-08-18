class Review < ApplicationRecord
  belongs_to :user

  validates :rating, inclusion: { in: (0..5) }
  validates :comment, presence: true, length: { minimum: 3 }
end
