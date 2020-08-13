class AddressesController < ApplicationController
  def index
    @address = Address.geocoded

    @markers = @address.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude
      }
    end
  end
end
