class ReviewsController < ApplicationController


  def new
    @review = Review.new
    @resto = Restaurant.find(params[:restaurant_id])
  end

  def create
    @resto = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @resto

    if @review.save
      redirect_to restaurant_path(@resto)
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  # def set_restaurant
  #   @resto = Restaurant.find(params[:restaurant_id])
  # end
end
