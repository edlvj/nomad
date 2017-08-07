class GraphqlController < ApplicationController
  def query
    context = {
      current_user: current_api_v1_user
    }
    
    result = Schema.execute(params[:query], context: context)
    render json: result
  end     
end