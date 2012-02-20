class Addcolumnstosetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :day, :integer
    add_column :setlists, :weight, :integer
    add_column :setlists, :reps, :integer
    
  end
end
