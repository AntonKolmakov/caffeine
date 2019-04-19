class AddOriginalFilenameToPageAttachment < ActiveRecord::Migration[5.0]
  def change
    add_column :page_attachments, :original_filename, :string
  end
end
