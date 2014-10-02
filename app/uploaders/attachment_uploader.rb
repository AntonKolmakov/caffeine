class AttachmentUploader < BaseUploader
  before :cache, :save_original_filename

  def extension_white_list
    %w(pdf doc htm html docx txt zip)
  end

  def filename
    original_filename.to_slug.transliterate(:russian).to_s.downcase if original_filename
  end

  def save_original_filename(file)
    model.original_filename ||= file.original_filename if file.respond_to?(:original_filename)
  end
end
