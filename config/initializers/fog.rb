CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJP6VQ22FZJWFAQYA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-southeast-1',                 # optional, defaults to 'us-east-1'
    #host:                  'rubytrainingimage.s3-website-ap-southeast-1.amazonaws.com',             # optional, defaults to nil
    #endpoint:              's3-ap-southeast-1.amazonaws.com' #'https://s3.example.com:8080' # optional, defaults to nil
  }

  config.fog_directory  = 'rubytrainingimage'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}

end