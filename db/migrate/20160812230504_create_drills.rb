class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.integer :run_id
      t.integer :weight
      t.integer :reps
      t.integer :rest_period

      t.timestamps null: false
    end
  end
end
