# encoding: utf-8

class AttachmentUploader < BaseUploader
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(pdf doc htm html docx txt)
  end

  def filename
    original_filename.to_slug.transliterate(:russian).to_s.downcase if original_filename
  end
end
