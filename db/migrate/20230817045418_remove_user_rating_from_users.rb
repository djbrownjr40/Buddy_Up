class RemoveUserRatingFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_rating, :integer
  end
end
