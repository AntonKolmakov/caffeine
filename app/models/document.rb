class Document < ActiveRecord::Base
  belongs_to :post

  validates :name, presence: true

  mount_uploader :attachment, AttachmentUploader
end
