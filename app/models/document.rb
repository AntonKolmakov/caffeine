class Document < ActiveRecord::Base
  belongs_to :post

  mount_uploader :attachment, AttachmentUploader
end
