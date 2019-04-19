class AddWatermarkToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :watermark, :string
  end
end
