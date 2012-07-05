class Job < ActiveRecord::Base
  attr_accessible :title, :how_to_apply, :job_profile, :other_skillsets, :requirements, :your_profile

  validates :title, presence: true
end
