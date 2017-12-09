class Admin::RestaurantsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def index
        @restaurants = Restaurant.all
    end
    #create a new restaurant record
    def new
        @restaurant = Restaurant.new
    end
    #save this restaurant record
    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            flash[:notice] = "restaurant was successfully created"
            redirect_to admin_restaurants_path
        else
            flash.now[:alert] = "restaurant was failed to create"
            render :new
        end
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    # private function
    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
    end

end
