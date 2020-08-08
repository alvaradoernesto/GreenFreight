class Load < ApplicationRecord
  belongs_to :user
  belongs_to :freight, optional: true
  belongs_to :load_category
  belongs_to :special_requirement

  validates :status, inclusion: {in: ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]}
end
