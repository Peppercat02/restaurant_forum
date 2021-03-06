class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.page(params[:page]).per(9)
        @categories = Category.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @comment = Comment.new
    end

    def feeds
        @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
        @recent_comments = Comment.order(created_at: :desc).limit(10)
    end

    def dashboard
        @restaurant = Restaurant.find(params[:id])
    end

    # POST /restaurants/:id/favorite
    def favorite
        @restaurant = Restaurant.find(params[:id])
        @restaurant.favorites.create!(user: current_user)
        redirect_back(fallback_location: root_path)
    end

    # POST /restaurants/:id/unfavorite
    def unfavorite
        @restaurant = Restaurant.find(params[:id])

        favorites = Favorite.where(restaurant: @restaurant, user: current_user)
        favorites.destroy_all
        redirect_back(fallback_location: root_path)
    end
    # POST /restaurants/:id/like
    def like
        @restaurant = Restaurant.find(params[:id])
        @restaurant.like.create!(user: current_user)
        redirect_back(fallback_location: root_path)
    end

    # POST /restaurants/:id/unlike
    def unlike
        @restaurant = Restaurant.find(params[:id])

        like = Like.where(restaurant: @restaurant, user: current_user)
        like.destroy_all
        redirect_back(fallback_location: root_path)
    end
end
