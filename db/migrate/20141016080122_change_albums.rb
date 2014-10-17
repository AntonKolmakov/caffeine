class ChangeAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.string  :slug
      t.boolean :fix_slug, default: false
      t.text    :description
      t.text    :short_description
    end
    add_index :albums, :slug
  end
end
