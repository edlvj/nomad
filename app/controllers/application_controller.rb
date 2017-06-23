class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  rescue_from CanCan::AccessDenied do
    head :forbidden
  end
  
  def vue
    render 'layouts/application'
  end
  
  private
  
  def current_ability
    @current_ability ||= Ability.new(current_api_v1_user)
  end
end
