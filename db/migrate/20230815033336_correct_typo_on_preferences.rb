class CorrectTypoOnPreferences < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :prefefrences, :preferences
  end
end
