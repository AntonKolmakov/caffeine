# encoding: utf-8
class PictureUploader < BaseUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :standard do
    process resize_to_limit: [1024, 768]
    process :watermark, if: :album_image?
  end

  version :thumb, if: :album_image? do
    process resize_to_limit: [160, 120]
  end

  def album_image?(_)
    model.is_a? Image
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Add watermark to big image
  def watermark
    watermark = MiniMagick::Image.open(model.album.watermark.file.path) if model.album.watermark

    manipulate! do |img|
      img = img.composite(watermark) do |c|
        c.compose 'Over'
        c.gravity 'SouthEast'
      end
      img = yield(img) if block_given?
      img
    end
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
