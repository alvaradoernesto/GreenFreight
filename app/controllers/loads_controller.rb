class LoadsController < ApplicationController
  def index
    @q = Load.ransack(params[:q])
    @loads = @q.result(distinct: true)
    if @loads.empty?
      @loads = Load.where(status: "Nueva")
    end
  end

  def show
    @load = Load.find(params[:id])
    @addresses = Load.addresses.geocoded
  end

  def new
    @load = Load.new
  end

  def create
    @load = Load.new(load_params)
    @load.user = current_user
    if @load.save
      redirect_to load_path(@load)
    else
      render :new
    end
  end

  def edit
    @load = Load.find(params[:id])
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
    params.require(:load).permit(:user, :start_date, :end_date, :hour_range,
                                 :start_point, :end_point, :weight, :volume, :status, :price)
  end
end
