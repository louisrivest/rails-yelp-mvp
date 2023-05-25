class RestaurantsController < ApplicationController

  def index
    @resto = Restaurant.all
  end

  def show
    @resto = Restaurant.find(params[:id])
  end

  def new
    @resto = Restaurant.new
  end

  def create
    @resto = Restaurant.new(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    if @resto.save
      redirect_to @resto, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @resto = Restaurant.find(params[:id])
  end

  def update
    @resto = Restaurant.find(params[:id])
    if @resto.update(restaurant_params)
      redirect_to @resto, notice: "Restaurant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resto = Restaurant.find(params[:id])
    @resto.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed."
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @resto = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :rating)
    end

end
