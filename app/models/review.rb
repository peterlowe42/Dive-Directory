class Review < ActiveRecord::Base
  include SessionsHelper
  attr_accessor :vis_units, :temp_units
  belongs_to :user
  belongs_to :divesite
  has_many :votes, as: :votable


  def convert_units
    if self.user.units == 'Imperial'
      self.vis *= 0.3048
      self.temp = ((self.temp - 32) * 5)/9
    end
  end
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end

  
end