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
# require 'database_cleaner'

# DatabaseCleaner.clean_with(:truncation)

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

# Create 30 nightmares for development
puts "------------------------"
puts "Création des cauchemars"
puts "------------------------"
30.times do
  nightmare = Nightmare.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: rand(1..10)
  )

  # Puts to show every time a dream is created
  puts 'Nightmare created'.light_blue
end

puts "------------------------"
puts "30 cauchemars ont été crées"
puts "------------------------\n\n"

# Create 30 lucids for development
puts "------------------------"
puts "Création des rêves lucides"
puts "------------------------"
30.times do
  lucid = Lucid.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: rand(1..10)
  )

  # Puts to show every time a dream is created
  puts 'Lucid created'.light_blue
end

puts "------------------------"
puts "30 rêves lucides ont été crées"
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

# Create 30 dreams for development admin
puts "------------------------"
puts "Création des rêves pour l'admin"
puts "------------------------"
15.times do
  dream = Dream.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: 11
  )

  # Puts to show every time a dream is created
  puts 'Dream created'.light_blue
end

puts "------------------------"
puts "15 rêves ont été crées pour l'admin"
puts "------------------------\n\n"

# Create 20 nightmares for development admin
puts "------------------------"
puts "Création des cauchemars pour l'admin"
puts "------------------------"
20.times do
  nightmare = Nightmare.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: 11
  )

  # Puts to show every time a dream is created
  puts 'Nightmare created'.light_blue
end

puts "------------------------"
puts "20 cauchemars ont été crées pour l'admin"
puts "------------------------\n\n"

# Create 10 lucids for development admin
puts "------------------------"
puts "Création des rêves lucides pour l'admin"
puts "------------------------"
10.times do
  lucid = Lucid.create!(
    title: Faker::Movie.quote,
    date: Date.today,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    emotion: ["Joie", "Gaieté", "Colère", "Excitation", "Dégoût", "Tourment", "Tristesse", "Découragement", "Souffrance", "Malheur", "Chagrin", "Anxiété", "Optimiste", "Satisfaction", "Soulagement"].sample,
    user_id: 11
  )

  # Puts to show every time a dream is created
  puts 'Lucids created'.light_blue
end

puts "------------------------"
puts "10 rêves lucides ont été crées pour l'admin"
puts "------------------------\n\n"

# Create 10 posts for development admin
puts "------------------------"
puts "Création des articles pour l'admin"
puts "------------------------"
10.times do
  post = Post.create!(
    title: Faker::Movie.quote,
    content: Faker::Lorem.paragraph_by_chars(number: 2000, supplemental: false),
    like: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    user_id: 11
  )

  # Puts to show every time a dream is created
  puts 'Posts created'.light_blue
end

puts "------------------------"
puts "10 rêves articles ont été crées pour l'admin"
puts "------------------------\n\n"