class AddExerciseNameToDrills < ActiveRecord::Migration[5.0]
  def change
    add_column :drills, :exercise_name, :string
  end
end
