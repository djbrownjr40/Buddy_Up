# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'deleteing previous db..'

puts 'bookings destroyed' if Booking.destroy_all
puts 'activities destroyed' if Activity.destroy_all
puts 'users destroyed' if User.destroy_all

puts 'creating seed...'

 brad = User.create!(
  email: "blbla@gmail.com",
  password: 'secret',
  username: "brad12",
  first_name: "Brad",
  last_name: "Bread",
  gender: "male",
  preferences: "straight",
  age: 24)
url = "https://this-person-does-not-exist.com/new?gender=#{brad.gender}&age=19-25&etnic=all"
json = URI.open(url).read
src = JSON.parse(json)['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
brad.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')


miyako = User.create!(
  email: "debbi_heller@ullrich-goyette.test",
  password: 'secret',
  username: "taylor_white",
  first_name: "Miyako",
  last_name: "Frami",
  gender: "Polygender",
  preferences: "Polygender",
  age: 48)
url = "https://this-person-does-not-exist.com/new?gender=#{miyako.gender}&age=19-25&etnic=all"
json = URI.open(url).read
src = JSON.parse(json)['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
miyako.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'secret',
    username: Faker::Internet.user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.type,
    preferences: Faker::Gender.type,
    age: (18..50).to_a.sample,
  )
  puts "User created! Username: #{user.username}"

  url = "https://this-person-does-not-exist.com/new?gender=#{user.gender}&age=19-25&etnic=all"
  json = URI.open(url).read
  src = JSON.parse(json)['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
  file = URI.open(photo_url)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

10.times do
  activity = Activity.create!(
    location: Faker::Address.community,
    name: Faker::Hobby.activity,
    description: Faker::Lorem.paragraph,
    hourly_rate: (5..20).to_a.sample * 1000,
    user: User.all.sample
  )
  url = "http://source.unsplash.com/featured/?#{activity.name}"
  file = URI.open(url)
  activity.photo.attach(io: file, filename: 'activity.png', content_type: 'image/png')
end

10.times do
  booking = Booking.create!(
    start_date: Faker::Date.forward(days: 50),
    status: (0..2).to_a.sample,
    user: User.all.sample,
    activity: Activity.all.sample,
    end_date: Faker::Date.forward(days: 50),
  )
  puts "Booking created! User: #{booking.user}, Activity: #{booking.activity}"
end

puts "created #{User.count} users, #{Activity.count} activities, #{Booking.count} bookings"
