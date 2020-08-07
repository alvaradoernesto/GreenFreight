class TrucksController < ApplicationController
  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    @truck_load_category = TruckLoadCategory.new(
      load_category: LoadCategory.find_by(name: params[:load_category]),
      truck: @truck
    )
    if @truck_load_category.save
      if @truck.save
        redirect_to truck_path(@truck)
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def truck_params
    params.require(:truck)
          .permit(:capacity, :truck_name, :driver_name, :driver_license, :truck_license, :price_per_km)
  end
end
