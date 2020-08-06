class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :truck_category

  has_many :truck_load_categories
  has_many :load_categories, through: :truck_load_categories
end
