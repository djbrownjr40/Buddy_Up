class RenameFullTextSearchToActivities < ActiveRecord::Migration[6.1]
  def change
    rename_table :activities_search, :new_activities_search
  end
end
