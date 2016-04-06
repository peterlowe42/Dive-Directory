class DivesiteLocation < ActiveRecord::Base
  belongs_to :divesite 
  belongs_to :location
end