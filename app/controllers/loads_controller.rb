class LoadsController < ApplicationController
  def index
    # if params[:query].present?
    #   sql_query = " \
    #     load.start_point @@ :query \
    #     AND load.end_point @@ :query \
    #     AND load.start_date @@ :query \
    #     AND load.end_date @@ :query \
    #     AND load.hour_range @@ :query \
    #     AND load.load_category_id @@ :query \
    #     AND load.special_requirement_id @@ :query \
    #   "
    #   @loads = Load.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @loads = Load.where(status: "Nueva")
    # end
    @q = Load.ransack(params[:q])
    @loads = @q.result(distinct: true)
  end

  def show
    @load = Load.find(params[:id])
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
