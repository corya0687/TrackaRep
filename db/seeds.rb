# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:"Corya0687", email:"corya0687@gmail.com", password: "test1234", role: 2)

User.create(username:"Mike", email:"none@none.com", password:"test1234", role: 0)
