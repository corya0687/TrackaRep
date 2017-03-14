class AddOneoffNameRuns < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :oneoff_name, :string
  end
end
