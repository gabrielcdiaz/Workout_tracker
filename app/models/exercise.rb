class Exercise < ActiveRecord::Base
  has_many :setlists
  has_many :workouts, :through => :setlists
  
  validates :name, :presence => true
  #Comment test
  
end
