class LoadCategory < ApplicationRecord
  has_many :loads
  has_many :truck_load_categories

  has_many :trucks, through: :truck_load_categories
  validates :description, inclusion: {in: ["Animales vivos", "Cajas", "Contenedores", "Gaseosos a granel", "Líquidos a granel", "Mudanza", "Otros", "Palletizado", "Rodados y maquinas", "Sólidos a granel"]}
end
