require 'carrierwave/orm/activerecord'


CarrierWave.configure do |config|
		  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  end
  
  # Use AWS storage if in production
  if Rails.env.production?
    config.storage = :aws
  end
  config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_credentials = {
    access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    region:            ENV.fetch('AWS_REGION') # Required
  }
end