class WorkoutRemoveColumns < ActiveRecord::Migration
  def change
    remove_column :setlists, :day, :integer
    remove_column :setlists, :weight, :integer
    remove_column :setlists, :reps, :integer
    
  end
end
