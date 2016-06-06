class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :reps
      t.integer :author_id
      t.integer :rest_period
      t.string :target_muscle
      t.string :equipment_needed

      t.timestamps null: false
    end
  end
end
