class CreateArticleTranslations < ActiveRecord::Migration
  def up
    Article.create_translation_table!({
      title: :string,
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Article.drop_translation_table! migrate_data: true
  end
end
