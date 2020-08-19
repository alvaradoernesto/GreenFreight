class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :cotizacion ]
  skip_before_action :verify_authenticity_token
  def home
  end

  def cotizacion
    @origen = params[:inputOrigin]
    @destino = params[:inputDestino]
  end
end
