class Freight < ApplicationRecord
  belongs_to :truck
  has_many :loads

  validates :status, inclusion: {in: ["Nuevo", "En tránsito", "Finalizado", "Cancelado"]}

  def routing!
    self.start_point = loads.first.start_point
    self.end_point = loads.last.end_point
    self.start_date = loads.first.start_date
    self.end_date = loads.last.end_date
    self.status = "Nueva"
    self.price = "300"
    self.capacity = loads.sum(&:volume)
    self.distance = freight_distance
    self.emissions = freight_emissions
  end

  private

  def freight_emissions
    loads.each do |load|
      # load.freight.truck.truck_load_category.emissions *
    end
    # TODO
  end

  def freight_distance
    loads.each do |load|
      # TODO
    end
  end
end
