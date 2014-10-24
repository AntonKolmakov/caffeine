class AddWatermarkToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :watermark, :string
  end
end
