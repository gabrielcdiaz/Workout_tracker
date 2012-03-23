# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@blue = Group.create(name: 'Blue')
@yellow = Group.create(name: "Yellow")

@exercises1 = ["Deadlift", "Squat", "Front Squat", "Weighted Dip", "Weighted Pullup"]
# @deadlift = Exercise.create (name: "Deadlift")
# @squat = Exercise.create (name: "Squat")
# @front_squat = Exercise.create (name: "Front Squat")
# @weighted_dip = Exercise.create (name: "Weighted Dip")
# @weighted_pullup = Exercise.create (name: "Weighted Pullup")
# @tg = Exercise.create (name: "Turkish Getup")

@workout1 = Workout.create(name: "Day 1")

@exercises1.each do |e|
  exe = Exercise.create(name: e)
  Setlist.create(:workout => @workout1, :exercise => exe)
end

@blue.workouts << @workout1

@exercises2 = ["Bench Press", "Bicep Curls", "Pull Ups", "Turkish Getup", "Stiff-legged Deadlift"]
# @deadlift = Exercise.create (name: "Deadlift")
# @squat = Exercise.create (name: "Squat")
# @front_squat = Exercise.create (name: "Front Squat")
# @weighted_dip = Exercise.create (name: "Weighted Dip")
# @weighted_pullup = Exercise.create (name: "Weighted Pullup")
# @tg = Exercise.create (name: "Turkish Getup")

@workout2 = Workout.create(name: "Day 1")

@exercises2.each do |e|
  exe = Exercise.create(name: e)
  Setlist.create(:workout => @workout2, :exercise => exe)
end

@yellow.workouts << @workout2
