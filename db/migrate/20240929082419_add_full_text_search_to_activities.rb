class AddFullTextSearchToActivities < ActiveRecord::Migration[6.1]
  def up
    unless table_exists?(:activities_search)
      execute <<-SQL
        CREATE VIRTUAL TABLE activities_search
      SQL
    end
  end

  def down
    # Rollback code if needed
    drop_table :activities_search, if_exists: true
  end
end

# USING fts5(name, location, description);
