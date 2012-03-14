module WorkoutsHelper
  
  def exercise_names
  Exercise.order("name ASC").collect {|e| [e.name, e.id]}
  # How would avi move this to the model? Is this in the right helper?
  end
  
  def group_names
    Group.all.collect {|e| [e.name, e.id]}
  end

end
