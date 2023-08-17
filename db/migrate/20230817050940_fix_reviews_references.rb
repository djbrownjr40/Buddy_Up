class FixReviewsReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :user, foreign_key: true, index: false
    add_reference :reviews, :activity, foreign_key: true
  end
end
