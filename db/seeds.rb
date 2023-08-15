# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Booking.destroy_all
Activity.destroy_all
User.destroy_all

p 'creating seed...'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'secret'
  )
end

10.times do
  Activity.create!(
    location: Faker::Address.community,
    name: Faker::Hobby.activity,
    description: Faker::Lorem.paragraph,
    hourly_rate: (5..50).to_a.sample,
    user: User.all.sample
  )
end

10.times do
  Booking.create!(
    date: Faker::Date.forward(days: 50),
    status: nil,
    user: User.all.sample,
    activity: Activity.all.sample
  )
end

p "created #{User.count} users, #{Activity.count} activities, #{Booking.count} bookings"
