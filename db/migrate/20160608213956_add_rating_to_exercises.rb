class AddRatingToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :rating, :integer
  end
end
