CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'ozablog'
  config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/ozablog"
  config.cache_storage = :fog
end