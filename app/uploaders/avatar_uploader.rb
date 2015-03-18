require 'carrierwave/processing/rmagick'

class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
  include CarrierWave::RMagick

  process resize_to_fill: [50, 100]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
