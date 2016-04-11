class Review < ActiveRecord::Base
  include SessionsHelper
  attr_accessor :vis_units, :temp_units
  belongs_to :user
  belongs_to :divesite
  has_many :votes, as: :votable
  if current_user.units == "Imperial"
    before_create convert_units
  end

  private

  def convert_units
      self.vis = self.vis * 0.3048
      self.temp = ((self.temp - 32) * 5)/9
  end
  
end