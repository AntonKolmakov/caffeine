class AddParentIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :parent_id, :integer
  end
end
