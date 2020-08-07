class FreightsController < ApplicationController
  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.loads = loads
    @freight.truck = current_user.truck
    @freight.routing!
    if @freight.save
      redirect_to freight_path(@freight)
    else
      render :new
    end
  end

  private

  def freight_params
    params.require(:freight).permit(load_ids: [])
  end

  def loads
    Load.find(freight_params[:load_ids])
  end
end
