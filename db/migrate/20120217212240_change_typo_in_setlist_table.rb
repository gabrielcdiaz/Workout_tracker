class ChangeTypoInSetlistTable < ActiveRecord::Migration

  def change
    rename_column :setlists, :workouts_id, :workout_id
  end
  
  
end
