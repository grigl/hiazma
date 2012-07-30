class AddSmallImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :small_image, :string
  end
end
