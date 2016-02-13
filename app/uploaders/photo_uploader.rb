# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
 include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :index do
    cloudinary_transformation effect: "brightness:30", radius: 6,
      width: 150, height: 150, crop: :fill
  end

  version :show do
    cloudinary_transformation effect: "brightness:30", radius: 6,
      width: 400, height: 250, crop: :fill
  end
end
