class Contact < ActiveRecord::Base
  attr_accessible :description

  translates :description
end
