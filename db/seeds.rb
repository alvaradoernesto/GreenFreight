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
SpecialRequirement.destroy_all
LoadCategory.destroy_all
TruckCategory.destroy_all

puts "Creating New Users"

tran_ernesto = User.new(
  email: "transporteernesto@gmail.com",
  password: "ernesto1234",
  address: "Lorenzo López 624, Pilar Centro, Provincia de Buenos Aires",
  name: "Transporte Ernesto",
  role: "Transportista"
)
user.save!

cargador_ernesto = User.new(
  email: "ernestocargador@gmail.com",
  password: "ernesto1234",
  address: "Belgrano 201, Chivilcoy, Provincia de Buenos Aires",
  name: "Ernesto Cargador",
  role: "Cargador"
)
user.save!

tran_mauricio = User.new(
  email: "transportemauricio@gmail.com",
  password: "mauricio1234",
  address: "Honduras 5207, C1414, Buenos Aires",
  name: "Transporte Mauricio",
  role: "Transportista"
)
user.save!

cargador_mauricio = User.new(
  email: "mauriciocargador@gmail.com",
  password: "mauricio1234",
  address: "Falucho 995, B7600FPS Mar del Plata, Provincia de Buenos Aires",
  name: "Mauricio Cargador",
  role: "Cargador"
)
user.save!

tran_nadia = User.new(
  email: "transportenadia@gmail.com",
  password: "nadia1234",
  address: "Arévalo 2279, FZC, Buenos Aires",
  name: "Transporte Nadia",
  role: "Transportista"
)
user.save!

cargador_nadia = User.new(
  email: "nadiacargador@gmail.com",
  password: "nadia1234",
  address: "Rueda 755, Rosario, Santa Fe Province",
  name: "Nadia Cargador",
  role: "Cargador"
)
user.save!

puts "Creating Truck Categories"

TruckCategory.new(name: "Petróleo", emissions: 500)
TruckCategory.new(name: "Diésel", emissions: 400)
TruckCategory.new(name: "Híbrido", emissions: 150)
TruckCategory.new(name: "Eléctrico", emission: 100)

puts "Creating Load Categories"

LoadCategory.new(name: "Animales vivos" )
LoadCategory.new(name: "Cajas" )
LoadCategory.new(name: "Contenedores" )
LoadCategory.new(name: "Gaseosos a granel" )
LoadCategory.new(name: "Líquidos a granel" )
LoadCategory.new(name: "Mudanza" )
LoadCategory.new(name: "Otros" )
LoadCategory.new(name: "Palletizado" )
LoadCategory.new(name: "Rodados y maquinaria pesada" )
LoadCategory.new(name: "Sólidos a granel" )

puts "Creating Special Requirements"

SpecialRequirement.new(name: "Apto alimentos")
SpecialRequirement.new(name: "Carga peligrosa")
SpecialRequirement.new(name: "Dimensiones especiales")
SpecialRequirement.new(name: "Frágil")
SpecialRequirement.new(name: "Ninguno")
SpecialRequirement.new(name: "Otros")
SpecialRequirement.new(name: "Refrigerado")

puts "Creating Load Status"

LOAD_STATUS = ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]

puts "Creating Freight Status"

FREIGHT_STATUS = ["Nuevo", "En tránsito", "Finalizado", "Cancelado"]

puts "Creating New Loads for User cargador_ernesto"

5.times do
  load = Load.new(
    user: cargador_ernesto,
    freight:
    start_date: Date.today-rand(30),
    end_date: Date.today+rand(30),
    hour_range:
    start_point:
    end_point:
    load_category:
    special_requirement:
    weight: Faker::Number.number(digits: 3),
    volume: Faker::Number.number(digits: 2),
    price: Faker::Number.number(digits: 3),
    status: LOAD_STATUS.sample,
  )
end


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

