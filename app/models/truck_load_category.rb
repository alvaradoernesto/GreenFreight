class TruckLoadCategory < ApplicationRecord
  validates :truck, uniqueness: { scope: :load_category }
end
