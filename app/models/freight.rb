class Freight < ApplicationRecord
  belongs_to :truck
  belongs_to :load
end
