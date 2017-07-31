module Api
  module V1
    class RatingsController < ApplicationController
      load_and_authorize_resource
      
      def create
        if @rating.save
          render json: @rating
        else
         render json: @rating.errors, status: :unprocessable_entity
        end
      end
      
      def rating_params
        params.require(:rating).permit(:city_id, :rate_type, :rate)
      end      
    end
  end  
end