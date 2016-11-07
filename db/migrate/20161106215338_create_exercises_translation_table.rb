class CreateExercisesTranslationTable < ActiveRecord::Migration
  def change
      reversible do |dir|
        dir.up do
          Exercise.create_translation_table!({
            :name => :string,
            :description => :string
          }, {
            :migrate_data => true,
            :remove_source_columns => true
          })
        end

        dir.down do
          Exercise.drop_translation_table! :migrate_data => true
        end
      end
    end
  end
