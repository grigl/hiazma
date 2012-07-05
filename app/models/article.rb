class Article < ActiveRecord::Base
  attr_accessible :description, :image, :title

  validates :title, presence: true
end
