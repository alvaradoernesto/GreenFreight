require 'json'
require 'open-uri'

class Freight < ApplicationRecord
  belongs_to :truck
  has_many :loads

  validates :status, inclusion: {in: ["Nuevo", "En tránsito", "Finalizado", "Cancelado"]}

  def routing!
    self.start_point = loads.first.start_point
    self.end_point = loads.last.end_point
    self.start_date = freight_start_date
    self.end_date = freight_end_date
    self.status = "Nuevo"
    self.capacity = loads.sum(&:volume)
    self.distance = freight_distance
    self.price = freight_price
    self.emissions = freight_emissions
  end

  private

  def freight_price
    self.distance * self.truck.price_per_km
  end

  def freight_end_date
    end_date = loads.firs.end_date
    loads.each do |load|
      if load.end_date > end_date
        end_date = load.start_date
      end
    end
    return end_date
  end


  def freight_start_date
    start_date = loads.firs.start_date
    loads.each do |load|
    if load.start_date < start_date
      start_date = load.start_date
    end
      return start_date
    end
  end

  def freight_emissions
    emissions = 0
    loads.each do |load|
      emissions =+ load.freight.truck.truck_load_category.emissions * Geocoder::Calculations.distance_between([load.start_point.location.latitude,load.start_point.location.longitude], [load.end_point.location.latitude,load.end_point.location.longitude])
    end
    return emissions
  end

  def freight_distance
    api_string = "https://api.mapbox.com/directions/v5/mapbox/driving-traffic/"
    loads.each do |load|
      api_string =+ load.location.latitude + "," + load.location.latitude + ";"
    end
    api_string = api_string[0..-2] + "?annotations=distance&overview=full&access_token=pk.eyJ1IjoibWF1cmljaW83NyIsImEiOiJja2F5aXM1dTUwam92MnpvN3VoZ3V3ZzNkIn0.RlRTMnbFVVPEl9jWVH08Bg"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    return user["routes"][0]["distance"].to_f
  end
end
