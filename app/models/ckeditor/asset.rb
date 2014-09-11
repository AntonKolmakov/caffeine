module Asset
  class Ckeditor < ActiveRecord::Base
    include ActiveRecord
    include Ckeditor::Orm::ActiveRecord::AssetBase

    delegate :url, :current_path, :content_type, to: :data

    validates :data, presence: true
  end
end
