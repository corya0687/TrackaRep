class AddSetNumberToDrills < ActiveRecord::Migration
  def change
    add_column :drills, :set_number, :integer
  end
end
