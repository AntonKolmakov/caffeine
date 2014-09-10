class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.string :attachment
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
