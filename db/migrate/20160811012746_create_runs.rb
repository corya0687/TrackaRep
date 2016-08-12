class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :duration
      t.string :type
      t.integer :asets
      t.integer :areps
      t.integer :aweight
      t.time :arest
      t.timestamp :completed_date

      t.timestamps null: false
    end
  end
end
