class Job < ActiveRecord::Base
  attr_accessible :title, :how_to_apply, :job_profile, :other_skillsets, :requirements, :your_profile

  translates :title, :how_to_apply, :job_profile, :other_skillsets, :requirements, :your_profile

  validates :title, presence: true

  before_create :get_position

  def get_position
    positions = Job.pluck(:position)
    self.position = ( positions.max + 1 if !positions.empty? ) || 0
  end
end
