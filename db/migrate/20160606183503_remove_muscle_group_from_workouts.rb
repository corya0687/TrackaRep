class RemoveMuscleGroupFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :muscle_group, :string
  end
end
