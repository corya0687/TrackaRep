class CreateWorkoutMuscleGroups < ActiveRecord::Migration
  def change
    create_table :workout_muscle_groups do |t|
      t.integer :workout_id
      t.integer :muscle_group_id

      t.timestamps null: false
    end
  end
end
