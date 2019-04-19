class AddAlbumIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :album_id, :integer
  end
end
