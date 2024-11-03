class AddSearchDataToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :search_data, :text
  end
end
