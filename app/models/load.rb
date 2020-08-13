class Load < ApplicationRecord
  belongs_to :user
  belongs_to :freight, optional: true
  has_many :load_category
  has_many :special_requirement
  has_many :addresses
  validates :status, inclusion: {in: ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]}
end
