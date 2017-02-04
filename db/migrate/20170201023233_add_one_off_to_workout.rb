class AddOneOffToWorkout < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :one_off, :boolean
  end
end
