class AddNameToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :name, :string
  end
end
