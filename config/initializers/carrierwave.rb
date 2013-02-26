CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIAEMYVZBH2QDZARA',                        # required
    :aws_secret_access_key  => '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',                        # required
  }
  config.fog_directory  = 'fh-thumbnails'                     # required
end