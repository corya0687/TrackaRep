class CreateMuscleGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :muscle_groups do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
