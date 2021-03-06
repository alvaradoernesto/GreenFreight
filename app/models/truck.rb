class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :truck_category

  has_many :truck_load_categories, inverse_of: :truck
  has_many :load_categories, through: :truck_load_categories
  has_many :freights
  has_one_attached :photo

  validates :truck_category, presence: true
  validates :price_per_km, presence: true

  accepts_nested_attributes_for :truck_load_categories, reject_if: :all_blank, allow_destroy: true
end
