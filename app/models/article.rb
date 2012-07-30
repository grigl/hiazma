class Article < ActiveRecord::Base
  attr_accessible :description, :image, :small_image, :title
  mount_uploader :image, ImageUploader
  mount_uploader :small_image, ImageUploader

  translates :title, :description
  accepts_nested_attributes_for :translations

  validates :title, presence: true
end
