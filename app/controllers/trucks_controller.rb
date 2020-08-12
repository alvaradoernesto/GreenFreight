class TrucksController < ApplicationController
  def new
    @truck = Truck.new
    @truck_load_category = TruckLoadCategory.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
      if @truck.save
        truck_load_params
        params[:truck][:truck_load_categories_attributes]["0"][:id].reject(&:blank?).each do |load|
          @load_cat = TruckLoadCategory.new(
             load_category_id: load,
             truck_id: @truck.id)
          @load_cat.save!
        end
        redirect_to truck_path(@truck)
      else
        render :new
      end
  end

  def show
    @truck = Truck.find(params[:id])
  end

  private

  def truck_params
    params.require(:truck)
          .permit(:capacity, :truck_name,
          :driver_name, :driver_license,
          :truck_license, :price_per_km, :truck_category_id, truck_load_categories: [:id])
  end

  def truck_load_params
    params[:truck]["truck_load_categories_attributes"].permit!
  end
end
