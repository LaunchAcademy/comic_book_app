# encoding: utf-8

class ComicBookCoverUploader < CarrierWave::Uploader::Base

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "http://image.shutterstock.com/display_pic_with_logo/425641/99491360/stock-photo-no-comic-book-explosion-99491360.jpg"
  end
end
