module Api
  module V1
    class TopicsController < ApplicationController
      load_and_authorize_resource
      
      def show
        render json: @topic, serializer: TopicSerializer
      end
       
      def create
        @topic.user_id = current_api_v1_user.id
        
        if @topic.save
          render json: @topic
        else
         render json: @topic.errors, status: :unprocessable_entity
        end
      end
      
      def topic_params
        params.require(:topic).permit(:city_id, :title, :text)
      end 
    end
  end  
end