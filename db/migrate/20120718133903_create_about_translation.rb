class CreateAboutTranslation < ActiveRecord::Migration
  def up
    About.create_translation_table!({
      title: :string,
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    About.drop_translation_table! migrate_data: true
  end
end
