class LoadCategory < ApplicationRecord
  has_many :loads
  has_many :truck_load_categories
end
