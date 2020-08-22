class FreightsController < ApplicationController
  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.status = "Nuevo"
    @freight.save!
    loads = Load.where(id: loads_params[:ids])
    loads.each do |load|
      load.freight = @freight
      load.save!
    end
    #@freight.routing!
    @freight.save!
    redirect_to freight_path(@freight)
  end

  def show
    @freight = Freight.find(params[:id])
  end

  def my_freights
    @freights = current_user.freights
  end

  private

  def freight_params
    params.require(:freight).permit(:truck_id)
  end

  def loads_params
    params.require(:loads).permit(ids: [])
  end
end
