Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.facebook_client_id, Figaro.env.facebook_client_secret, display: :popup 
end