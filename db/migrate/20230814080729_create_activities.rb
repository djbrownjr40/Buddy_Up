class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :location
      t.string :description
      t.integer :hourly_rate
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
