class CreateProjectTranslation < ActiveRecord::Migration
  def up
    Project.create_translation_table!({
      title: :string,
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Project.drop_translation_table! migrate_data: true
  end
end
