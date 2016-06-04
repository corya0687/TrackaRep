class CreateTargetMuscles < ActiveRecord::Migration
  def change
    create_table :target_muscles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
