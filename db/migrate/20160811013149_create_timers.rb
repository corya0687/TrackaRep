class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.time :seconds

      t.timestamps null: false
    end
  end
end
