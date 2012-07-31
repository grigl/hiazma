class Job < ActiveRecord::Base
  attr_accessible :title, :field_1, :field_2, :field_3, :field_4, :field_5, :field_6, :field_7,
                  :field_8, :field_9, :field_10

  translates :title, :field_1, :field_2, :field_3, :field_4, :field_5, :field_6, :field_7,
             :field_8, :field_9, :field_10

  validates :title, presence: true

  before_create :get_position

  def get_position
    positions = Job.pluck(:position)
    self.position = ( positions.max + 1 if !positions.empty? ) || 0
  end
end
