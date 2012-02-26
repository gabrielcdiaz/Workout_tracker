class Workout < ActiveRecord::Base
  belongs_to :group
  has_many :setlists
  has_many :exercises, :through => :setlists
  
  accepts_nested_attributes_for :setlists
  
  validates :name, :presence => true
  validates :name, :exclusion  => {:in => "Workout", :message => "for this workout should be more specific. Help us out here!"}
 
  # Why can't I get this to work?? See Below
  #validates :name, {:unqiueness => true, on => :create}
  # Read the validations guide! http://guides.rubyonrails.org/active_record_validations_callbacks.html
  
end