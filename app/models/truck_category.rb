class TruckCategory < ApplicationRecord
  has_many :trucks

  validates :name, inclusion: {in: ["Petróleo", "Diésel", "Híbrido", "Eléctrico", "Ninguno"]}
end
