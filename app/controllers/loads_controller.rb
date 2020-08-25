class LoadsController < ApplicationController
  def index
    @q = Load.where(status: "Nueva").joins(:start_point, :end_point).ransack(params[:q])
    @loads = @q.result(distinct: true)
    if @loads.empty?
      @loads = Load.where(status: "Nueva")
    end
    @freight = Freight.new
    @markers = @loads.map do |load|
      unless load.start_point.latitude.nil? && load.start_point.longitude.nil?
      {
        lat: load.start_point.latitude,
        lng: load.start_point.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { load: load, freight: @freight})
      }
      end
    end
    @markers.reject! { |x| x.nil? }
  end

  def show
    @load = Load.find(params[:id])
    @addresses = [@load.start_point, @load.end_point]
    @markers = @addresses.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude
      }
    end
  end

  def add_load
    raise
    @load = Load.find(params[:id])
    @freight.loads << @load
  end

  def new
    @load = Load.new
    @load.build_start_point
    @load.build_end_point
    # @start_point = StartPoint.new
    # @end_point = EndPoint.new
  end

  def create
    @load = Load.new(load_params)
    @load.user = current_user
    @load.status = "Nueva"
    if @load.save!
      redirect_to load_path(@load)
    else
      render :new
    end
  end

  def edit
    @load = Load.find(params[:id])
  end

  def myloads
    @load = Load.where(user: current_user)
  end

  def update
    @load.find(params[:id])
    @load.update(load_params)
    @load.save
    redirect_to load_path(@load)
  end

  def destroy
    @load = Load.find(params[:id])
    @load.destroy
    redirect_to load_path
  end

  private

  def load_params
    params.require(:load).permit(:user, :start_date, :end_date, :hour_range, :load_category_id, :special_requirement_id,
                                 :weight, :volume, start_point_attributes: [:location, :latitude, :longitude], end_point_attributes: [:location, :latitude, :longitude])
  end
end
