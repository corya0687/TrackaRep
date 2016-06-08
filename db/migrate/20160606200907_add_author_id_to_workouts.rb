class AddAuthorIdToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :author_id, :integer
  end
end
