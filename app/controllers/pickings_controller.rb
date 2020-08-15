class PickingsController < ApplicationController
  def index
    @pickings = Picking.all
  end

  def new
    @picking = Picking.new
  end

  def create
    @picking = Picking.new(params[:picking])
    @picking.user = current_user
    @picking.save
  end
end
