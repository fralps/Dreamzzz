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

# Create 10 users for development
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