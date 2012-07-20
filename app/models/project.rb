class Project < ActiveRecord::Base
  attr_accessible :description, :image, :link, :title
  mount_uploader :image, ImageUploader

  translates :description, :title

  validates :title, presence: true

  before_create :get_position

  def get_position
    positions = Project.pluck(:position)
    self.position = ( positions.max + 1 if !positions.empty? ) || 0
  end
end
