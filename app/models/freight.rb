class Freight < ApplicationRecord
  belongs_to :truck
  has_many :loads

  def routing!
    self.start_point = loads.first.start_point
    self.end_point = loads.last.end_point
    self.start_date = loads.first.start_date
    self.end_date = loads.last.end_date
    self.status = "Nueva"
    self.price = "300"
    self.capacity = loads.sum(&:volume)
    self.distance = "300"
    self.emissions = "300"
  end
end
