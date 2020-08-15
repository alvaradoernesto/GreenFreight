class Load < ApplicationRecord
  belongs_to :user
  belongs_to :freight, optional: true
  has_many :load_category
  has_many :special_requirement
  has_one :start_point
  has_one :end_point
  accepts_nested_attributes_for :start_point
  accepts_nested_attributes_for :end_point
  validates :status, inclusion: {in: ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]}
end
