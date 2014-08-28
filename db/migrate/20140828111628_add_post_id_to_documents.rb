class AddPostIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :post_id, :string
  end
end
