class CreateExerciseTargetMuscles < ActiveRecord::Migration
  def change
    create_table :exercise_target_muscles do |t|
      t.integer :exercise_id
      t.integer :target_muscle_id

      t.timestamps null: false
    end
  end
end
