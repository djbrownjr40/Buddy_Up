class RemovePhotosFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_photo, :string
  end
end
