class AddFixSlagToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :fix_slug, :boolean, default: false
  end
end
