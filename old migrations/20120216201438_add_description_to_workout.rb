class AddDescriptionToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :description, :text
  end
end
