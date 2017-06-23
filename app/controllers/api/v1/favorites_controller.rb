module Api
  module V1
    class FavoritesController < ApplicationController
      load_and_authorize_resource
      
      def create
        @favorite = Favorite.find_or_initialize_by(user_id: current_api_v1_user.id, city_id: favorite_params[:city_id])
        if @favorite.update_attribute(:visited, favorite_params[:visited])
          render json: @favorite
        else
         render json: @favorite.errors, status: :unprocessable_entity
        end
      end
      
      def favorite_params
        params.require(:favorite).permit(:city_id, :visited)
      end      
    end
  end  
end