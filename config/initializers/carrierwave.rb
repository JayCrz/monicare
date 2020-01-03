CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV['AWSAccessKeyId'],
      aws_secret_access_key:  ENV['AWSSecretKey'],
      host: 's3-ap-northeast-1.amazonaws.com',
      region: 'ap-northeast-1'
    }
    config.fog_directory = ENV['S3BucketName']
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end