# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Colorize just for fun
require 'colorize'

# Faker gem
require 'faker'

# To limit the database entries
# each time we seed we delete the previous ones and we reset database's ids
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

User.destroy_all
Dream.destroy_all

# Create 10 users for development
puts "------------------------"
puts "Création des utilisateurs"
puts "------------------------"
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  # Puts to show every time an user is created
  puts 'User created'.green
end

puts "------------------------"
puts "10 utilisateurs ont été crées"
puts "------------------------\n\n"

# Create 30 dreams for development
puts "------------------------"
puts "Création des rêves"
puts "------------------------"
30.times do
  dream = Dream.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    category: ["Rêve", "Cauchemar", "Rêve lucide"].sample,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: rand(1..10)
  )

  # Puts to show every time a dream is created
  puts 'Dream created'.light_blue
end

puts "------------------------"
puts "30 rêves ont été crées"
puts "------------------------\n\n"

# Create Admin
puts "------------------------"
puts "Création de l'administrateur"
puts "------------------------"
admin = User.create!(
	first_name: "John",
	last_name: "Doe",
	email: "admin@yopmail.com",
	password: "admin1234",
	is_admin: true
	)
# Puts to show when the admin is created
puts 'Admin created'.light_green