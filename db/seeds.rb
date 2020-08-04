# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"

puts "Clearing Database..."
Load.destroy_all
Freight.destroy_all
Truck.destroy_all
User.destroy_all

puts "Creating New Users"

user = User.new(
  email: "ernesto@airtool.com",
  password: "ernesto1234"
)
user.save!

user = User.new(
  email: "nadia@airtool.com",
  password: "nadia1234"
)
user.save!

user = User.new(
  email: "mauricio@airtool.com",
  password: "mauricio1234"
)
user.save!


puts "Creating New Loads"

# load = Load.new(
#   user = "Ernesto",
#   freight = "Camiones del plata",
#   start_date = Date.today-rand(30),
#   end_date = Date.today+rand(30),
#   hour_range = "mañana",
#   load_category = LoadCategory,
#   special_requirement = SpecialRequirement,
#   weight = 200,
#   volume = 40,
#   status = "Pendiente",
#   price = 1250
# )
# load.save!


# puts "Creating New Truck"

# truck = Truck.new(
#   price_per_km = 200,
#   capacity = 30000,
#   truck_category = "Diesel"
# )
# truck.save!

