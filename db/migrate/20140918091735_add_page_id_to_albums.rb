class AddPageIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :page_id, :integer
  end
end
