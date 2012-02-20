class Group < ActiveRecord::Base
  has_many :workouts
  
  validates :name, :presence => true
  
end
