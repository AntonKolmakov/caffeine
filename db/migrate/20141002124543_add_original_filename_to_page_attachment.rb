class AddOriginalFilenameToPageAttachment < ActiveRecord::Migration
  def change
    add_column :page_attachments, :original_filename, :string
  end
end
