class TruckLoadCategory < ApplicationRecord
  belongs_to :truck
  belongs_to :load_category
end
