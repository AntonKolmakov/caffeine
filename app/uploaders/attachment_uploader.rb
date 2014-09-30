# encoding: utf-8

class AttachmentUploader < BaseUploader
  def extension_white_list
    %w(pdf doc htm html docx txt zip)
  end

  def filename
    original_filename.to_slug.transliterate(:russian).to_s.downcase if original_filename
  end
end
