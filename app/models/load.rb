class Load < ApplicationRecord
  STATUSES = ["Nueva", "Asignada", "En tránsito", "Entregada", "Cancelada"]

  belongs_to :user
  belongs_to :freight, optional: true
  belongs_to :load_category
  belongs_to :special_requirement

  has_many :addresses
  has_one :start_point
  has_one :end_point
  has_one_attached :photo

  accepts_nested_attributes_for :start_point
  accepts_nested_attributes_for :end_point

  validates :status, inclusion: {in: STATUSES}
end
