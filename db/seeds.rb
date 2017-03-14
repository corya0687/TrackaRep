# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##--> Add users

##--> Add Musclses
#philly lat/long = 39.9526/-75.1652
#range = 0.05

muscle_groups = ['UpperBody', 'Core', 'LowerBody']
target_muscles = {
	1 => ['Calves', 'Quads'],
	2 => ['Abs', 'Gluteus Maximus', 'Obliques'],
	3 => [ 'Shoulders','Triceps', 'Chest', 'Biceps', 'Traps', 'Lats']
}
muscle_groups.each do |mg_name|
  MuscleGroup.find_or_create_by!(name: mg_name)
end

target_muscles.each do |mg_id, tg_names|
  mg = MuscleGroup.find(mg_id)
  tg_names.each {|name| mg.target_muscles.create!(name: name)}
end
