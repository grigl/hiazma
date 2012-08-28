class ChangeDateFormatArticle < ActiveRecord::Migration
  def self.up
    change_column :articles, :created_at, :date
  end

  def self.down
    change_column :articles, :created_at, :date
  end
end
