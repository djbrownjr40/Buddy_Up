# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'deleteing previous db..'

Booking.destroy_all
Activity.destroy_all
User.destroy_all

puts 'creating seed...'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'secret',
    username: Faker::Internet.user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.type,
    preferences: Faker::Gender.type,
    age: (18..50).to_a.sample,
    user_rating: (0..5).to_a.sample
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
# add_column :users, :username, :string
# add_column :users, :first_name, :string
# add_column :users, :last_name, :string
# add_column :users, :gender, :string
# add_column :users, :prefefrences, :string
# add_column :users, :age, :integer
# add_column :users, :user_rating, :integer

10.times do
  Booking.create!(
    start_date: Faker::Date.forward(days: 50),
    status: (0..2).to_a.sample,
    user: User.all.sample,
    activity: Activity.all.sample,
    end_date: Faker::Date.forward(days: 50),
  )
end

puts "created #{User.count} users, #{Activity.count} activities, #{Booking.count} bookings"
