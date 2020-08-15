class Load < ApplicationRecord
  STATUSES = ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]

  belongs_to :user
  belongs_to :freight, optional: true
  belongs_to :load_category
  belongs_to :special_requirement
  belongs_to :picking

  has_many :addresses
  validates :status, inclusion: {in: STATUSES}
end
