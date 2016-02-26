require 'geocoder'
class Location < ActiveRecord::Base
  geocoded_by :address
  validates :address, presence: true
  after_validation :geocode
end
