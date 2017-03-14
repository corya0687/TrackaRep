class AddNameToTargetMuscles < ActiveRecord::Migration[5.0]
  def change
    add_column :target_muscles, :name, :string
  end
end
