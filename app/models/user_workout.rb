class UserWorkout < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  belongs_to :user
  
  def self.of_exercise(exercise_id)
       where("user_workouts.exercise_id = ? ", exercise_id)
  end
  
end
