class AddMuscleGroupIdToTargetMuscles < ActiveRecord::Migration[5.0]
  def change
    add_column :target_muscles, :muscle_group_id, :integer
  end
end
