class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.references :workouts
      t.references :exercise
      t.timestamps
    end
  end
end
