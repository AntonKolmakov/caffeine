class PageAttachment < ActiveRecord::Base
  belongs_to :page

  mount_uploader :attachment, AttachmentUploader
end
