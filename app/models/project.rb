class Project < ActiveRecord::Base
  attr_accessible :description, :image, :link, :title

  validates :title, presence: true
end
