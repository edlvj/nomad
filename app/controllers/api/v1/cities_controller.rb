module Api
  module V1
    class CitiesController < ApplicationController
      load_and_authorize_resource
      
      def index
        @cities = @cities.where('title LIKE ?', "%#{ params[:search] }%") if params[:search]
        render json: @cities, each_serializer: CitiesSerializer  
      end
      
      def show
        render json: @city, serializer: CitySerializer 
      end  
    end
  end  
end