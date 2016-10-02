class AddWorkoutIdToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :workout_id, :integer
  end
end
