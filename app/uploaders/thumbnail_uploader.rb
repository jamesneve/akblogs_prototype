class ThumbnailUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [100, 100]

end
