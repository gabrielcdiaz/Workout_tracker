class SchemaAsOfMarch2012 < ActiveRecord::Migration
  def up
    create_table "exercises", :force => true do |t|
      t.string   "name"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "groups", :force => true do |t|
      t.string   "name"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "setlists", :force => true do |t|
      t.integer  "workout_id"
      t.integer  "exercise_id"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
    end

    create_table "user_workouts", :force => true do |t|
      t.integer  "workout_id"
      t.integer  "user_id"
      t.integer  "exercise_id"
      t.integer  "weight"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
    end

    create_table "users", :force => true do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "email"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
      t.string   "password_digest"
    end
  end

  def down
  end
end
