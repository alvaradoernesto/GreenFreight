class Freight < ApplicationRecord
  belongs_to :truck
  has_many :loads
end
