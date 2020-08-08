class SpecialRequirement < ApplicationRecord
  has_many :loads

  validates :name, inclusion: {in: ["Apto alimentos", "Carga peligrosa", "Dimensiones especiales", "Frágil", "Ninguno", "Otros", "Refrigerado"]}
end
