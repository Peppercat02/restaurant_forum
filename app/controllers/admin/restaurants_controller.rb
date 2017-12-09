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

    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
    #read restaurant records
    def show
    end
    #edit a restaurant record
    def edit
    end
    #update a restaurant record
    def update
      if @restaurant.update(restaurant_params)
        redirect_to admin_restaurant_path(@restaurant)
        flash[:notice] = "restaurant was successfully updated"
      else
        render :edit
        flash[:alert] = "restaurant was failed to update"
      end
    end
    #delete a restaurant record
    def destroy
      @restaurant.destroy
      redirect_to admin_restaurants_path
      flash[:alert] = "restaurant was deleted"
    end
    # private function
    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
