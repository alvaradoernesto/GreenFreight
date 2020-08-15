class Load < ApplicationRecord
  STATUSES = ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]

  belongs_to :user
  belongs_to :freight, optional: true
  has_many :load_category
  has_many :special_requirement
  has_many :addresses
  validates :status, inclusion: {in: STATUSES}
end
