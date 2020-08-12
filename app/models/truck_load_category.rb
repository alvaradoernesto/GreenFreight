class TruckLoadCategory < ApplicationRecord
  belongs_to :truck
  belongs_to :load_category

  validates :truck, uniqueness: { scope: :load_category }
end
