class Dropcolumndayfromworkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :day
  end
end
