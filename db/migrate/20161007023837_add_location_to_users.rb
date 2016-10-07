class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :double
    add_column :users, :longtitude, :double
  end
end
