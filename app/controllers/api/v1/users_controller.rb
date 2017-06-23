module Api
  module V1
    class UsersController < ApplicationController
      load_and_authorize_resource
     
      def show
        render json: @user, serializer: UserSerializer 
      end
      
    end
  end  
end