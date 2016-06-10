class AddCombinedRaitingToWorkoutExercises < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :combined_rating, :integer
  end
end
