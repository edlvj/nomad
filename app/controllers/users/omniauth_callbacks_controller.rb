require 'koala'
class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

 # after_action :set_headers, only: :custom_omniauth 

  def get_resource_from_auth_hash
    info = auth_hash['info']
  
    @resource = resource_class.find_or_initialize_by(email: info['email'])
    @resource.uid = auth_hash['uid']
    @resource.provider = auth_hash['provider']

    if @resource.new_record?
      @oauth_registration = true
      set_random_password
    end

    assign_provider_attrs(@resource, auth_hash)

    extra_params = whitelisted_params
    @resource.assign_attributes(extra_params) if extra_params
    
    @resource
  end
  
  def custom_omniauth
    if params[:provider] == 'facebook'
      @fb_client = Koala::Facebook::OAuth.new(Figaro.env.facebook_client_id, Figaro.env.facebook_client_secret, "http://#{request.host}/")
      fb_token = @fb_client.get_access_token(params[:code]) if params[:code]
      
      @graph = Koala::Facebook::API.new(fb_token)
      info = @graph.get_object("me?fields=id,name,email,picture.type(large),link")

      @resource = User.find_or_initialize_by(email: info['email'])
      @resource.uid = info['id']
      @resource.provider = params[:provider]
      @resource.nickname =  info['name']
      @resource.image = info['picture']['data']['url']

      create_token_info
      set_token_on_resource
      create_auth_params

      if @resource.new_record?
        @oauth_registration = true
        set_random_password
        @resource.save
      end
      
      sign_in(:user, @resource, store: false, bypass: false)

      render json: @auth_params.merge(id: @resource.id)
    end
  end
 
  def resource_class(mapping = nil)
    'User'.constantize
  end
  
  private
=begin 
  def set_headers
    response.headers["access-token"] = @auth_params[:auth_token]
    response.headers["client"] = @auth_params[:client_id]
    response.headers["uid"] = @auth_params[:uid]
    response.headers["expiry"] = @auth_params[:expiry]
  end
=end 
end