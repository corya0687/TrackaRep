class AddRunIdToTargetMuscles < ActiveRecord::Migration[5.0]
  def change
    add_column :target_muscles, :run_id, :integer
  end
end
