class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :divesite
  
end