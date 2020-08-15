class TruckCategory < ApplicationRecord
  has_many :trucks

  validates :description, inclusion: {in: ["Petróleo", "Diésel", "Híbrido", "Eléctrico", "Ninguno"]}
end
