Rails.application.routes.draw do
  root to: 'application#vue'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: '/auth', skip: [:confirmations],
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
      get '/custom/:provider/callback', to: '/users/omniauth_callbacks#custom_omniauth'
      
      resources :cities, only: [:index, :show]
      resources :users, only: [:show]
      resources :favorites, only: [:create]
      resources :topics, only: [:show, :create]
      resources :comments, only: [:create]
      resources :ratings, only: [:create]
    end  
  end
  
  get '*path', to: 'application#vue'
end
