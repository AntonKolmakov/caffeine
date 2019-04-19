class AddFixSlagToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :fix_slug, :boolean, default: false
  end
end
