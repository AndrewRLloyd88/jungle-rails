class ReviewsController < ApplicationController
  before_filter :authorize, only: :create
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to '/'
    else
      redirect_to :back
    end
  end

 private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end 