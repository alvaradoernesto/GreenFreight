class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :cotizacion ]
  skip_before_action :verify_authenticity_token
  def home
  end

  def cotizacion
    @origen = Geocoder.coordinates(params[:inputOrigin])
    @destino = Geocoder.coordinates(params[:inputDestino])
    @distancia = Geocoder::Calculations.distance_between([@origen[0],@origen[1]], [@destino[0],@destino[1]])
    @promedio = Truck.average(:price_per_km)
    @cotizacion = @distancia * @promedio
  end
end
