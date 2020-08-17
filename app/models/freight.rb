class Freight < ApplicationRecord
  belongs_to :truck
  has_many :loads

  validates :status, inclusion: {in: ["Nuevo", "En tránsito", "Finalizado", "Cancelado"]}

  def routing!
    self.start_point = self.loads.first.start_point.location
    self.end_point = self.loads.last.end_point.location
    self.start_date = freight_start_date
    self.end_date = freight_end_date
    self.status = "Nuevo"
    self.capacity = loads.sum(&:volume)
    self.distance = freight_distance(self.loads)
    self.price = freight_price
    self.emissions = freight_emissions(self.loads)
  end

  private

  def freight_price
    self.distance * self.truck.price_per_km
  end

  def freight_end_date
    end_date = self.loads.first.end_date
    self.loads.each do |load|
      if load.end_date > end_date
        end_date = load.start_date
      end
    end
    return end_date
  end


  def freight_start_date
    start_date = self.loads.first.start_date
    self.loads.each do |load|
    if load.start_date < start_date
      start_date = load.start_date
    end
      return start_date
    end
  end

  def freight_emissions(array)
    emissions = 0
    array.each do |load|
      emissions =+ load.freight.truck.truck_category.emissions * Geocoder::Calculations.distance_between([load.start_point.latitude,load.start_point.longitude], [load.end_point.latitude,load.end_point.longitude])
    end
    return emissions
  end

  def freight_distance(array)
    # api_string = "https://api.mapbox.com/optimized-trips/v1/mapbox/driving/"
    # loads.each do |load|
    #   api_string += load.start_point.latitude.to_s + "," + load.start_point.longitude.to_s + ";"
    #   api_string += load.end_point.latitude.to_s + "," + load.end_point.longitude.to_s + ";"
    # end
    # api_string = api_string[0..-2] + "?access_token=pk.eyJ1IjoibWF1cmljaW83NyIsImEiOiJja2F5aXM1dTUwam92MnpvN3VoZ3V3ZzNkIn0.RlRTMnbFVVPEl9jWVH08Bg"
    # user_serialized = open(api_string).read
    # user = JSON.parse(user_serialized)
    # return user["routes"][0]["distance"].to_f
    sum = 0
    array.each do |load|
      sum += Geocoder::Calculations.distance_between([load.start_point.latitude,load.start_point.longitude],[load.end_point.latitude,load.end_point.longitude])
    end
    return sum
  end
end
