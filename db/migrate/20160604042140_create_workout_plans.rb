class CreateWorkoutPlans < ActiveRecord::Migration
  def change
    create_table :workout_plans do |t|
      t.integer :plan_id
      t.integer :workout_id

      t.timestamps null: false
    end
  end
end
