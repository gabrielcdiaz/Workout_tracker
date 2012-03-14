class CreateUserWorkouts < ActiveRecord::Migration
  def change
    create_table :user_workouts do |t|
      t.references :workout
      t.references :user
      t.string :exercise
      t.integer :weight
      
      t.timestamps
    end
  end
end
