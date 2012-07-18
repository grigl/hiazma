class Article < ActiveRecord::Base
  attr_accessible :description, :image, :title
  mount_uploader :image, ImageUploader

  translates :title, :description
  accepts_nested_attributes_for :translations

  validates :title, presence: true
end
