# db/seeds.rb
require 'active_record'
require 'faker'
require_relative '../app/models/role'
require_relative '../app/models/audition'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

puts "Cleaning up database..."
Audition.destroy_all
Role.destroy_all

puts "Seeding 10 roles..."
10.times do
  Role.create!(
    character_name: Faker::TvShows::Friends.character
  )
end

puts "Seeding 30 auditions..."
30.times do
  Audition.create!(
    actor: Faker::Name.name,
    location: Faker::Address.city,
    phone: Faker::PhoneNumber.phone_number,
    hired: [true, false].sample,
    role_id: Role.all.sample.id
  )
end

puts "Database seeded! Roles: #{Role.count}, Auditions: #{Audition.count}"

