class LoadCategory < ApplicationRecord
  has_many :load

  validates :name, inclusion: {in: ["Animales vivos", "Cajas", "Contenedores", "Gaseosos a granel", "Líquidos a granel", "Mudanza", "Otros", "Palletizado", "Rodados y maquinaria pesada", "Sólidos a granel"]}
end
