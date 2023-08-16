class RemovePhotosFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :activity_photo, :string
  end
end
