class Exercise < ActiveRecord::Base
  has_many :setlists
  has_many :workouts, :through => :setlists
  has_many :user_workouts
  has_many :users, :through => :userworkouts
  
  validates :name, :presence => true

  
end
