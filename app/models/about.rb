class About < ActiveRecord::Base
  attr_accessible :description, :title

  translates :title, :description
end
