# encoding: utf-8
class ContentBuilderImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :sftp
  end
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # Use quality to compress the image
  # resize_to_limit - Resize the image to fit within the specified dimensions while 
  # retaining the original aspect ratio. Will only resize the image if it is larger 
  # than the specified dimensions. The resulting image may be shorter or narrower 
  # than specified in the smaller dimension but will not be larger than the specified 
  # values.
  # resize_to_fit - Resize the image to fit within the specified dimensions while 
  # retaining the original aspect ratio. The image may be shorter or narrower than 
  # specified in the smaller dimension but will not be larger than the specified values.
  # resize_to_fill - Resize the image to fit within the specified dimensions while 
  # retaining the aspect ratio of the original image. If necessary, crop the image in 
  # the larger dimension. Optionally, a "gravity" may be specified, for example 
  # "Center", or "NorthEast".
  # resize_and_pad - Resize the image to fit within the specified dimensions while 
  # retaining the original aspect ratio. If necessary, will pad the remaining area 
  # with the given color, which defaults to transparent (for gif and png, white 
  # for jpeg). Optionally, a "gravity" may be specified, as above.
  version :left_or_right do
    process resize_to_fit: [640, 360]
  end

  version :center do
    process resize_to_fit: [1280, 720]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Mitigate CVE-2016-3714
  def content_type_whitelist
    [/image\//]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      image_format = original_filename.match(/\.([^.]*)$/).to_a.first
      image_name = original_filename.gsub(/\.([^.]*)$/, "").parameterize
      return "#{image_name}#{image_format}"
    end
  end
end