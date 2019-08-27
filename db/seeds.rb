# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Periods
#Period.create(cod: "20191", from: Date.new(2019, 01, 01), to: Date.new(2019, 06, 30))
#Period.create(cod: "20192", from: Date.new(2019, 07, 01), to: Date.new(2019, 12, 31))

#Period.create(cod: "20201", from: Date.new(2020, 01, 01), to: Date.new(2020, 06, 30))
#Period.create(cod: "20202", from: Date.new(2020, 07, 01), to: Date.new(2020, 12, 31))

#Deparments
#10.times do#
#  d = Department.new(name: Faker::Educator.campus)
#  d.save
#end

#Programs

#periods = Period.all

#periods.each do |period|
  #Cambiar RAND() por función de motor de BD
#  5.times do
#    Program.create(name: Faker::Educator.degree,
#                   description: Faker::Lorem.sentence(word_count: 30),
#                   status: [:active],
#                   period: period,
#                   department: Department.all.sample)
#  end
#end
