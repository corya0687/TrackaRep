class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.string :name

      t.timestamps null: false
    end
  end
end
