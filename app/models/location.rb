class Location < ActiveRecord::Base
  has_many :divesite_locations
  has_many :divesites, through: :divesite_locations

  
end