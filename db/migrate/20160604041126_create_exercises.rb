class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :descrition
      t.integer :reps
      t.integer :rest_period
      t.string :muscle_group
      t.string :equipment_needed

      t.timestamps null: false
    end
  end
end
