class CreateExercisesTranslationTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.timestamps
    end

    reversible do |dir|
        dir.up do
          Exercise.create_translation_table! :name => :string, :description => :string
        end

        dir.down do
          Exercise.drop_translation_table!
        end
    end
  end
end
