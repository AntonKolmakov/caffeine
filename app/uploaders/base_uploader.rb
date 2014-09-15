class BaseUploader < CarrierWave::Uploader::Base
  if %w(staging production).include? Rails.env
    storage :fog
  else
    storage :file
  end
end
