class AddAlbumIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :album_id, :integer
  end
end
