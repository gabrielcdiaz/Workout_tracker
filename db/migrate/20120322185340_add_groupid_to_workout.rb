class AddGroupidToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :group_id, :integer
  end
end
