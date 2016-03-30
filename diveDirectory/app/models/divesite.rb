class Divesite < ActiveRecord::Base
  has_many :reviews
  has_many :divesite_locations
  has_many :locations, through :divesite_locations
end
