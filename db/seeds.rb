# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##--> Add users
cory = User.create(username:"Corya0687", email:"corya0687@gmail.com", password: "test1234", role: 2)

mike = User.create(username:"Mike", email:"none@none.com", password:"test1234", role: 0)

##--> Add Musclses

traps = TargetMuscle.create(name:"Traps")
biceps= TargetMuscle.create(name:"Biceps")
Upperback= TargetMuscle.create(name:"Upper Back")
TargetMuscle.create(name:"Lower Back")
TargetMuscle.create(name:"Hamstrings")
TargetMuscle.create(name:"Calves")
quads= TargetMuscle.create(name:"Quadriceps")
chest= TargetMuscle.create(name:"Chest")
TargetMuscle.create(name:"Abdominal")
TargetMuscle.create(name:"Shoulder")
TargetMuscle.create(name:"Triceps")
TargetMuscle.create(name:"Glutes")

##->Add Exercises

curl = Exercise.create(name: "Barbell Curl", description: "Bicep curls with Barbell", reps: 8, author_id: 1, rest_period: 90, equipment_needed: "Barbell")

curl.target_muscles << biceps

press = Exercise.create(name: "Bench Press", description: "Chest press on weight bench", reps: 8, author_id: 2, rest_period: 90, equipment_needed: "Barbell")

press.target_muscles << chest

pushdown = Exercise.create(name: "Tricep Pushdown", description: "Standing", reps: 8, author_id: 2, rest_period: 90, equipment_needed: "Pulley")

pushdown.target_muscles << traps
