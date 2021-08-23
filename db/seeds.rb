# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 100 fake schools...'
100.times do
  school = School.new(
    name:    Faker::Educator.secondary_school,
    school_type: "Academy",
    address: Faker::Address.full_address,
    summary: Faker::Lorem.paragraph(sentence_count: 3),
    founded_at:  rand(1440..2000),
    price: rand(0..15000),
    number_of_pupils: rand(100..1800),
    grade_5_or_above: rand(40..100),
    aab_or_above: rand(40..100),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
  )
  school.save!
end
puts 'Finished!'
