class RemoveParentIdFromAlbums < ActiveRecord::Migration[5.0]
  def up
    remove_column :albums, :parent_id
  end

  def down
    add_column :albums, :parent_id, :integer
  end
end
