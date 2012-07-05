class Project < ActiveRecord::Base
  attr_accessible :description, :image, :link, :title
  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
