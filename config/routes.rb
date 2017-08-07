Rails.application.routes.draw do
  root to: 'application#vue'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  post '/graphql', to: 'graphql#query'
  
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: '/auth', skip: [:confirmations],
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
      get '/custom/:provider/callback', to: '/users/omniauth_callbacks#custom_omniauth'
    end  
  end
  
  get '*path', to: 'application#vue'
end
