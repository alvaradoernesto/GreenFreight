class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :truck_category
end
