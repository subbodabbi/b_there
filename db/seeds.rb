# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "Password1234!", phone_number: Faker::PhoneNumber.phone_number, country: Faker::Address.country_code )
end

70.times do
  Listing.create(user_id: rand(91..115), address: Faker::Address.street_address, max_guests: Faker::Number.digit, price: Faker::Number.number(2), title: Faker::Lorem.sentence , description: Faker::Lorem.paragraph )
end