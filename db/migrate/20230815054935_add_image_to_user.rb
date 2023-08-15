class AddImageToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_photo, :string
  end
end
