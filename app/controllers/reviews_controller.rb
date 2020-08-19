class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @truck = Truck.find(params[:truck_id])
    @review.truck = @truck
    @review.user_id = current_user.id
    @review.save
    redirect_to truck_path(@truck)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
