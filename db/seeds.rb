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


User.all.each do |user|
  user.longtitude = rand(-75.21...-75.11)
  user.save
end
