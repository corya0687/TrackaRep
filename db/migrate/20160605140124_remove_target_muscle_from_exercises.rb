class RemoveTargetMuscleFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :target_muscle, :string
  end
end
