module Api
  module V1
    class CommentsController < ApplicationController
      load_and_authorize_resource
      
      def create
        @comment.user_id = current_api_v1_user.id
        
        if @comment.save
          render json: @comment
        else
         render json: @comment.errors, status: :unprocessable_entity
        end
      end
      
      def comment_params
        params.require(:comment).permit(:topic_id, :text)
      end

    end
  end  
end