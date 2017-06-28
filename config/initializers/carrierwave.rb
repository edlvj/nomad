CarrierWave.configure do |config|
  config.dropbox_app_key             = Figaro.env.dropbox_app_key
  config.dropbox_app_secret          = Figaro.env.dropbox_app_secret
  config.dropbox_access_token        = Figaro.env.dropbox_access_token
  config.dropbox_access_token_secret = Figaro.env.dropbox_access_token_secret
  config.dropbox_user_id             = Figaro.env.dropbox_user_id
  config.dropbox_access_type         = "app_folder"
end