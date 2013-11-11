# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Users
Jobs::Seeds::Users.new.perform

# Create Categories
Jobs::Seeds::Categories.new.perform

# Create Items
Jobs::Seeds::Items.new.perform

# Add Categories to Items
Jobs::Seeds::AddItemCategories.new.perform

# Add User Purchases
Jobs::Seeds::Purchases.new.perform