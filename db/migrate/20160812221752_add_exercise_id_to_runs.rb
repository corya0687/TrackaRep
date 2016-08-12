class AddExerciseIdToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :exercise_id, :integer

  end
end
