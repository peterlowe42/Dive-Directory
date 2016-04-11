class Review < ActiveRecord::Base
  attr_accessor :vis_units, :temp_units
  belongs_to :user
  belongs_to :divesite
  has_many :votes, as: :votable
  before_create convert_units

  private

  def convert_units
    if self.vis_units == 'Feet'
      self.vis = self.vis * 0.3048
    end
    if self.temp_units == "Fahrenheit"
      self.temp = ((self.temp - 32) * 5)/9
    end
  end
  
end