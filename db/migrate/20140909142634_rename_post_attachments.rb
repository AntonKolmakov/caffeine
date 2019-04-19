class RenamePostAttachments < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        rename_table :post_attachments, :page_attachments
        rename_column :page_attachments, :post_id, :page_id
      end

      dir.down do
        rename_table :page_attachments, :post_attachments
        rename_column :post_attachments, :page_id, :post_id
      end
    end
  end
end
