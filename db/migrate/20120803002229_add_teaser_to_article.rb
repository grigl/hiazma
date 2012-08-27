class AddTeaserToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :teaser, :text
    add_column :article_translations, :teaser, :text
  end
end
