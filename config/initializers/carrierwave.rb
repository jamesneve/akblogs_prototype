CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIAEMYVZBH2QDZARA',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'fh-thumbnails'
end