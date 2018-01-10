require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
  end

  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Figaro.env.aws_access_key_id,
      aws_secret_access_key: Figaro.env.aws_secret_access_key,
      region: 'us-east-1',
    }
    config.fog_directory = Figaro.env.aws_bucket
  end
end