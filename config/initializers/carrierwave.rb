CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI6FXAV2E76ELVK5Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-east-1',                  # optional, defaults to 'us-east-1'
    host:                  's3.amazonaws.com',             # optional, defaults to nil
    endpoint:              'https://s3.amazonaws.com/' # optional, defaults to nil
  }
  config.fog_directory  = 'yv-input'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

