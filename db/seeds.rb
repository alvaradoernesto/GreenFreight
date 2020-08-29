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
StartPoint.destroy_all
EndPoint.destroy_all


puts "Creating New Users"

tran_ernesto = User.new(
  email: "transporteernesto@gmail.com",
  password: "ernesto1234",
  address: "Lorenzo López 624, Pilar Centro, Provincia de Buenos Aires",
  name: "Transporte Ernesto",
  role: "Transportista"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U010026QV2Q-21399e9af22d-512')
tran_ernesto.avatar.attach(io: file, filename: "#{tran_ernesto.name}.png", content_type: 'image/png')
tran_ernesto.save!

cargador_ernesto = User.new(
  email: "ernestocargador@gmail.com",
  password: "ernesto1234",
  address: "Belgrano 201, Chivilcoy, Provincia de Buenos Aires",
  name: "Ernesto Cargador",
  role: "Cargador"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U010026QV2Q-21399e9af22d-512')
cargador_ernesto.avatar.attach(io: file, filename: "#{cargador_ernesto.name}.png", content_type: 'image/png')
cargador_ernesto.save!

tran_mauricio = User.new(
  email: "transportemauricio@gmail.com",
  password: "mauricio1234",
  address: "Honduras 5207, Buenos Aires",
  name: "Transporte Mauricio",
  role: "Transportista"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U0105LQJJ56-bd4c0813ae97-512')
tran_mauricio.avatar.attach(io: file, filename: "#{tran_mauricio.name}.png", content_type: 'image/png')
tran_mauricio.save!

cargador_mauricio = User.new(
  email: "mauriciocargador@gmail.com",
  password: "mauricio1234",
  address: "Francia 981, Luján, Provincia de Buenos Aires",
  name: "Mauricio Cargador",
  role: "Cargador"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U0105LQJJ56-bd4c0813ae97-512')
cargador_mauricio.avatar.attach(io: file, filename: "#{cargador_mauricio.name}.png", content_type: 'image/png')
cargador_mauricio.save!

tran_nadia = User.new(
  email: "transportenadia@gmail.com",
  password: "nadia1234",
  address: "Rueda 755, Rosario, Provincia de Santa Fe",
  name: "Transporte Nadia",
  role: "Transportista"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-UV362N1GB-99b98618119c-512')
tran_nadia.avatar.attach(io: file, filename: "#{tran_nadia.name}.png", content_type: 'image/png')
tran_nadia.save!

cargador_nadia = User.new(
  email: "nadiacargador@gmail.com",
  password: "nadia1234",
  address: "Av. Victorica 660, Moreno, Provincia de Buenos Aires",
  name: "Nadia Cargador",
  role: "Cargador"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-UV362N1GB-99b98618119c-512')
cargador_nadia.avatar.attach(io: file, filename: "#{cargador_nadia.name}.png", content_type: 'image/png')
cargador_nadia.save!

puts "Creating Truck Categories"

TruckCategory.create(description: "Petróleo", emissions: 500)
TruckCategory.create(description: "Diésel", emissions: 400)
TruckCategory.create(description: "Híbrido", emissions: 150)
TruckCategory.create(description: "Eléctrico", emissions: 100)

puts "Creating Load Categories"

LoadCategory.create(description: "Cajas")
LoadCategory.create(description: "Contenedores")
LoadCategory.create(description: "Mudanza")
LoadCategory.create(description: "Otros")
LoadCategory.create(description: "Palletizado")

puts "Creating Special Requirements"

SpecialRequirement.create(description: "Apto alimentos")
SpecialRequirement.create(description: "Carga peligrosa")
SpecialRequirement.create(description: "Frágil")
SpecialRequirement.create(description: "Ninguno")
SpecialRequirement.create(description: "Otros")

puts "Creating Load Status"

LOAD_STATUS = ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]

puts "Creating Freight Status"

FREIGHT_STATUS = ["Nuevo", "En tránsito", "Finalizado", "Cancelado"]

puts "Creating Hour Ranges"

HOUR_RANGES = ["7:00-12:00", "12:00-17:00", "17:00-22:00"]

puts "Creating Load End Points"

LOAD_END_POINTS = [
  "San Martín 2152, Campana, Provincia de Buenos Aires",
  "Av. San Martín 1747, Baradero, Provincia de Buenos Aires",
  "Undiano 264, Bahía Blanca, Provincia de Buenos Aires",
  "Pasteur 220, Mar del Plata, Provincia de Buenos Aires",
  "San Luis 542, Rosario, Provincia de Santa Fe",
  "Victor Vergani 860, Pilar, Provincia de Buenos Aires",
  "Av. Hipólito Yrigoyen 511, Córdoba, Provincia de Córdoba",
  "Mitre 1099, San Pedro, Provincia de Buenos Aires",
  "Av. Carlos Pellegrini 431, Quilmes, Provincia de Buenos Aires"
]

puts "Creating Truck Names"

TRUCK_NAMES = ["Scania", "Daf", "Man", "Mercedes", "Iveco", "Volvo", "Renault", "Isuzu", "Nissan"]

puts "Creating Truck Capacities"

TRUCK_CAPACITIES = [20, 40, 70, 130]

puts "Creating Truck Drivers´ Names"

TRUCK_DRIVER_NAMES = ['Raul Moya', 'Miguel Gay', 'Alejandro Fuentes', 'Francisco Garcia', 'Rafael Quintero', 'Albert Lopez', 'Javier Martinez', 'Manuel Sola', 'Cesar Rodriguez', 'Pablo Gaspar', 'Alfonso Canales', 'Juan Gonzalez', 'Carlos Andrade', 'angel Rodriguez', 'Adrian Huerta', 'Francisco Javier Miro', 'Jose Luis Lopez', 'Juan Jose Oliva', 'Jaime Sotelo', 'Jose Antonio Garcia', 'Manuel Esteban', 'Jaime Estevez', 'Jesus Luque', 'Raul Morales', 'Sergio Paredes', 'Francisco Varela', 'Jose Manuel Hidalgo', 'Antonio Guasch', 'Pilar Miguel', 'Maria Luisa Chavez', 'Maria Carmen Hernandez', 'Elena Gutierrez', 'Lucia Criado', 'Maria Rodriguez', 'Maria Teresa Gonzalez', 'Manuel Quevedo', 'Jose Manuel Garcia', 'Jose Manuel Gonzalez', 'Pilar Jodar', 'Rafael Navarro', 'Alejandro Galindo', 'Jose Larraniaga', 'Isabel Maria aguila']

puts "Creating Trucks"

[tran_ernesto, tran_mauricio, tran_nadia].each do |tran|
  5.times do
    truck = Truck.new(
      price_per_km: rand(60.2..70.3),
      capacity: TRUCK_CAPACITIES.sample,
      user: tran,
      truck_category: TruckCategory.all.sample,
      driver_name: TRUCK_DRIVER_NAMES.sample,
      driver_license: "C-#{rand(10..45)}#{rand(999)}#{rand(999)}",
      truck_license: "#{["AA", "AB", "AC", "AD", "AE"].sample}#{rand(999)}#{["AF", "EJ", "IH", "OK", "UY"].sample}",
    )
    truckname = TRUCK_NAMES.sample
    truck.photo.attach(io: File.open("app/assets/images/Camion#{truckname}.jpg"), filename: "#{truckname}.png", content_type: 'image/png')
    truck.truck_name = "#{truckname} - #{truck.capacity}m3"
    truck.save!
  end
end

puts "Creating Loads - Status: 'Nueva'"

[cargador_ernesto, cargador_mauricio, cargador_nadia].each do |loader|
  10.times do
    oneload = Load.new(
      user: loader,
      start_date: Date.today+rand(1..10),
      end_date: Date.today+rand(11..20),
      hour_range: HOUR_RANGES.sample,
      load_category_id: LoadCategory.pluck(:id).sample,
      special_requirement_id: SpecialRequirement.pluck(:id).sample,
      weight: Faker::Number.between(from: 10, to: 25000),
      volume: Faker::Number.between(from: 1, to: 130),
      status: "Nueva",
    )
    oneload.photo.attach(io: File.open("app/assets/images/LC#{LoadCategory.find_by(id: oneload.load_category_id).description}.jpg"), filename: "#{LoadCategory.find_by(id: oneload.load_category_id).description}.png", content_type: 'image/png')
    oneload.save!
    start_point = StartPoint.new(load: oneload, location: oneload.user.address)
    end_point  = EndPoint.new(load: oneload, location: LOAD_END_POINTS.sample)
    start_point.save!
    end_point.save!
  end
end

puts "Creating Truck Load Categories"

Truck.all.each do |truck|
 truck_load_category = TruckLoadCategory.new(truck: truck, load_category: LoadCategory.all.sample)
 truck_load_category.save
end

puts "Creating Freights - Status: 'Nuevo'"

Truck.all.each do |truck|
  freight = Freight.new(
    truck: truck,
    status: "Nuevo",
  )
  freight.save!
  freight_cap = 0
  load_cap = 0
  unless freight_cap > truck.capacity
    load_cap = Faker::Number.between(from: 1, to: truck.capacity.to_i)
    freight_cap += load_cap
    oneload = Load.new(
      user: [cargador_ernesto, cargador_mauricio, cargador_nadia].sample,
      start_date: Date.today+rand(1..3),
      end_date: Date.today+rand(4..6),
      hour_range: HOUR_RANGES.sample,
      load_category: truck.load_categories.first,
      special_requirement_id: SpecialRequirement.pluck(:id).sample,
      weight: Faker::Number.between(from: 10, to: 25000),
      volume: load_cap,
      status: "Asignada",
    )
    oneload.photo.attach(io: File.open("app/assets/images/LC#{LoadCategory.find_by(id: oneload.load_category_id).description}.jpg"), filename: "#{LoadCategory.find_by(id: oneload.load_category_id).description}.png", content_type: 'image/png')
    oneload.freight_id = freight.id
    oneload.save!
    start_point = StartPoint.new(load: oneload, location: oneload.user.address)
    end_point  = EndPoint.new(load: oneload, location: LOAD_END_POINTS.sample)
    start_point.save!
    end_point.save!
  end
  freight.save!
end

puts "Creating Freights - Status: 'En tránsito'"

Truck.all.each do |truck|
  freight = Freight.new(
    truck: truck,
    status: "En tránsito",
  )
  freight.save!
  freight_cap = 0
  load_cap = 0
  unless freight_cap > truck.capacity
    load_cap = Faker::Number.between(from: 1, to: truck.capacity.to_i)
    freight_cap += load_cap
    oneload = Load.new(
      user: [cargador_ernesto, cargador_mauricio, cargador_nadia].sample,
      start_date: Date.today,
      end_date: Date.today+1,
      hour_range: HOUR_RANGES.sample,
      load_category: truck.load_categories.first,
      special_requirement_id: SpecialRequirement.pluck(:id).sample,
      weight: Faker::Number.between(from: 10, to: 25000),
      volume: load_cap,
      status: "En tránsito",
    )
    oneload.photo.attach(io: File.open("app/assets/images/LC#{LoadCategory.find_by(id: oneload.load_category_id).description}.jpg"), filename: "#{LoadCategory.find_by(id: oneload.load_category_id).description}.png", content_type: 'image/png')
    oneload.freight_id = freight.id
    oneload.save!
    start_point = StartPoint.new(load: oneload, location: oneload.user.address)
    end_point  = EndPoint.new(load: oneload, location: LOAD_END_POINTS.sample)
    start_point.save!
    end_point.save!
  end
  freight.save!
end

puts "Creating Freights - Status: 'Finalizado'"

Truck.all.each do |truck|
  2.times do
    freight = Freight.new(
      truck: truck,
      status: "Finalizado",
    )
    freight.save!
    freight_cap = 0
    load_cap = 0
    unless freight_cap > truck.capacity
      load_cap = Faker::Number.between(from: 1, to: truck.capacity.to_i)
      freight_cap += load_cap
      oneload = Load.new(
        user: [cargador_ernesto, cargador_mauricio, cargador_nadia].sample,
        start_date: Date.today-rand(21..40),
        end_date: Date.today-rand(0..20),
        hour_range: HOUR_RANGES.sample,
        load_category: truck.load_categories.first,
        special_requirement_id: SpecialRequirement.pluck(:id).sample,
        weight: Faker::Number.between(from: 10, to: 25000),
        volume: load_cap,
        status: "Entregada",
      )
      oneload.photo.attach(io: File.open("app/assets/images/LC#{LoadCategory.find_by(id: oneload.load_category_id).description}.jpg"), filename: "#{LoadCategory.find_by(id: oneload.load_category_id).description}.png", content_type: 'image/png')
      oneload.freight_id = freight.id
      oneload.save!
      start_point = StartPoint.new(load: oneload, location: oneload.user.address)
      end_point  = EndPoint.new(load: oneload, location: LOAD_END_POINTS.sample)
      start_point.save!
      end_point.save!
    end
    freight.save!
  end
end

puts "Creating Freights - Status: 'Cancelado'"

Truck.all.each do |truck|
  freight = Freight.new(
    truck: truck,
    status: "Cancelado",
  )
  freight.save!
  freight_cap = 0
  load_cap = 0
  unless freight_cap > truck.capacity
    load_cap = Faker::Number.between(from: 1, to: truck.capacity.to_i)
    freight_cap += load_cap
    oneload = Load.new(
      user: [cargador_ernesto, cargador_mauricio, cargador_nadia].sample,
      start_date: Date.today-rand(21..40),
      end_date: Date.today-rand(0..20),
      hour_range: HOUR_RANGES.sample,
      load_category: truck.load_categories.first,
      special_requirement_id: SpecialRequirement.pluck(:id).sample,
      weight: Faker::Number.between(from: 10, to: 25000),
      volume: load_cap,
      status: "Cancelada",
    )
    oneload.photo.attach(io: File.open("app/assets/images/LC#{LoadCategory.find_by(id: oneload.load_category_id).description}.jpg"), filename: "#{LoadCategory.find_by(id: oneload.load_category_id).description}.png", content_type: 'image/png')
    oneload.freight_id = freight.id
    oneload.save!
    start_point = StartPoint.new(load: oneload, location: oneload.user.address)
    end_point  = EndPoint.new(load: oneload, location: LOAD_END_POINTS.sample)
    start_point.save!
    end_point.save!
  end
  freight.save!
end

puts "Creating support channel"

channel = Chatroom.new(name: :soporte)
channel.save!

puts "Creating PITCH STORY"

puts "Creating LOADER STORY"

cargador_francisco = User.new(
    email: "francisco@gmail.com",
    password: "francisco1234",
    address: "Salto, Provincia de Buenos Aires",
    name: "Herrería Salto",
    role: "Cargador"
  )
  file = URI.open('https://images-na.ssl-images-amazon.com/images/I/71wFlc9LrvL._AC_SX522_.jpg')
  cargador_francisco.avatar.attach(io: file, filename: "#{cargador_francisco.name}.png", content_type: 'image/png')
  cargador_francisco.save!

load1 = Load.new(
  user: cargador_francisco,
  start_date: Date.today-21,
  end_date: Date.today-21,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 20,
  volume: 3,
  status: "Entregada",
)
load1.photo.attach(io: File.open("app/assets/images/Carga1.jpeg"), filename: "RepisasFlotantes.png", content_type: 'image/png')
load1.save!
start_point = StartPoint.new(load: load1, location: load1.user.address)
end_point  = EndPoint.new(load: load1, location: "Lujan, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load2 = Load.new(
  user: cargador_francisco,
  start_date: Date.today-21,
  end_date: Date.today-21,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 60,
  volume: 6,
  status: "Entregada",
)
load2.photo.attach(io: File.open("app/assets/images/Carga2.jpg"), filename: "RepisasFlotantes.png", content_type: 'image/png')
load2.save!
start_point = StartPoint.new(load: load2, location: load2.user.address)
end_point  = EndPoint.new(load: load2, location: "San Justo, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load3 = Load.new(
  user: cargador_francisco,
  start_date: Date.today-14,
  end_date: Date.today-14,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 80,
  volume: 8,
  status: "Entregada",
)
load3.photo.attach(io: File.open("app/assets/images/Carga3.jpg"), filename: "RepisasEstatica.png", content_type: 'image/png')
load3.save!
start_point = StartPoint.new(load: load3, location: load3.user.address)
end_point  = EndPoint.new(load: load3, location: "Olivos, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load4 = Load.new(
  user: cargador_francisco,
  start_date: Date.today-14,
  end_date: Date.today-14,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 100,
  volume: 10,
  status: "Entregada",
)
load4.photo.attach(io: File.open("app/assets/images/Carga4.jpg"), filename: "Faroles.png", content_type: 'image/png')
load4.save!
start_point = StartPoint.new(load: load4, location: load4.user.address)
end_point  = EndPoint.new(load: load4, location: "Caballito, Buenos Aires")
start_point.save!
end_point.save!

load5 = Load.new(
  user: cargador_francisco,
  start_date: Date.today,
  end_date: Date.today,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 120,
  volume: 16,
  status: "En tránsito",
)
load5.photo.attach(io: File.open("app/assets/images/Carga5.jpg"), filename: "Escritorio.png", content_type: 'image/png')
load5.save!
start_point = StartPoint.new(load: load5, location: load5.user.address)
end_point  = EndPoint.new(load: load5, location: "Pilar, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load6 = Load.new(
  user: cargador_francisco,
  start_date: Date.today+7,
  end_date: Date.today+9,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 120,
  volume: 16,
  status: "Nueva",
)
load6.photo.attach(io: File.open("app/assets/images/Carga6.jpg"), filename: "Escritorio.png", content_type: 'image/png')
load6.save!
start_point = StartPoint.new(load: load6, location: load6.user.address)
end_point  = EndPoint.new(load: load6, location: "Palermo, Buenos Aires")
start_point.save!
end_point.save!

load7 = Load.new(
  user: cargador_francisco,
  start_date: Date.today+12,
  end_date: Date.today+14,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 120,
  volume: 18,
  status: "Nueva",
)
load7.photo.attach(io: File.open("app/assets/images/Carga7.png"), filename: "Faroles.png", content_type: 'image/png')
load7.save!
start_point = StartPoint.new(load: load7, location: load7.user.address)
end_point  = EndPoint.new(load: load7, location: "Villa Urquiza, Buenos Aires")
start_point.save!
end_point.save!

load8 = Load.new(
  user: cargador_francisco,
  start_date: Date.today+7,
  end_date: Date.today+9,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 100,
  volume: 14,
  status: "Nueva",
)
load8.photo.attach(io: File.open("app/assets/images/Carga8.png"), filename: "Faroles.png", content_type: 'image/png')
load8.save!
start_point = StartPoint.new(load: load8, location: load8.user.address)
end_point  = EndPoint.new(load: load8, location: "Ezeiza, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load9 = Load.new(
  user: cargador_francisco,
  start_date: Date.today+12,
  end_date: Date.today+14,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 30,
  volume: 3,
  status: "Nueva",
)
load9.photo.attach(io: File.open("app/assets/images/Carga9.png"), filename: "Faroles.png", content_type: 'image/png')
load9.save!
start_point = StartPoint.new(load: load9, location: load9.user.address)
end_point  = EndPoint.new(load: load9, location: "Caseros, Provincia de Buenos Aires")
start_point.save!
end_point.save!

load10 = Load.new(
  user: cargador_francisco,
  start_date: Date.today+12,
  end_date: Date.today+14,
  hour_range: "12:00-17:00",
  load_category_id: 4,
  special_requirement_id: 3,
  weight: 200,
  volume: 22,
  status: "Nueva",
)
load10.photo.attach(io: File.open("app/assets/images/Carga10.png"), filename: "Faroles.png", content_type: 'image/png')
load10.save!
start_point = StartPoint.new(load: load10, location: load10.user.address)
end_point  = EndPoint.new(load: load10, location: "Martinez, Provincia de Buenos Aires")
start_point.save!
end_point.save!

puts "Creating TRANSPORTIST STORY"

tran_pilar = User.new(
  email: "transportedelpilar@gmail.com",
  password: "transporte1234",
  address: "Pilar, Provincia de Buenos Aires",
  name: "Transportes del Pilar",
  role: "Transportista"
)
file = URI.open('https://png.pngtree.com/png-vector/20190826/ourlarge/pngtree-truck-transportation-logo-png-image_1693082.jpg')
tran_pilar.avatar.attach(io: file, filename: "#{tran_pilar.name}.png", content_type: 'image/png')
tran_pilar.save!

truck1 = Truck.new(
  price_per_km: 65,
  capacity: 25,
  user: tran_pilar,
  truck_category_id: 2,
  driver_name: "Santiago Villar",
  driver_license: "C-28325650",
  truck_license: "AB327EF",
  truck_name: "Iveco 25m3"
)
truck1.photo.attach(io: File.open("app/assets/images/CamionIvecoUsuario.jpeg"), filename: "Iveco25m3.png", content_type: 'image/png')
truck1.save!
truck_load_category = TruckLoadCategory.new(truck: truck1, load_category_id: 4)
truck_load_category.save

truck2 = Truck.new(
  price_per_km: 65,
  capacity: 25,
  user: tran_pilar,
  truck_category_id: 2,
  driver_name: "Carlos Ortiz",
  driver_license: "C-35346751",
  truck_license: "AA428UX",
  truck_name: "Ford 25m3"
)
truck2.photo.attach(io: File.open("app/assets/images/CamionFordUsuario.jpg"), filename: "Ford25m3.png", content_type: 'image/png')
truck2.save!
truck_load_category = TruckLoadCategory.new(truck: truck2, load_category_id: 4)
truck_load_category.save

freight1 = Freight.new(
    truck: truck1,
    status: "Finalizado",
  )
freight1.save!
load1.freight_id = freight1.id
load2.freight_id = freight1.id
freight1.save!

freight2 = Freight.new(
    truck: truck2,
    status: "Finalizado",
  )
freight2.save!
load3.freight_id = freight2.id
load4.freight_id = freight2.id
freight2.save!

freight3 = Freight.new(
    truck: truck1,
    status: "En tránsito",
  )
freight3.save!
load5.freight_id = freight3.id
freight3.save!

puts "Finished"
