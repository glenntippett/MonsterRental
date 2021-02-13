# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Booking.destroy_all
Monster.destroy_all
User.destroy_all


user1 = User.create(email: "drhammer@gmail.com", password: '123456', username: "drhammer1944")

puts "Created #{User.count} users"

puts 'Creating monsters'
15.times do
  monster_name = Faker::Games::WarhammerFantasy.creature
  monster_description = Faker::Quote.famous_last_words
  monster_price = rand(10..1000)
  puts "Creating #{monster_name}"
  Monster.create!(name: monster_name, description: monster_description, price: monster_price, user_id: user1.id)
end

puts "Created #{Monster.count} monsters"


puts 'Creating bookings'
15.times do
  booking_start_date =  Faker::Date.forward(days: 12)
  booking_end_date = Faker::Date.forward(days: 265)
  booking_total_price = rand(10..1000)
  puts "Creating bookings"
  Booking.create!(start_date: booking_start_date, end_date: booking_end_date, total_price: booking_total_price, user_id: user1.id, monster_id: Monster.all.sample.id)
end

puts "Created #{Booking.count} bookings"
