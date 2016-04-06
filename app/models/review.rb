class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :divesite
  has_many :votes, as: :votable
  
end