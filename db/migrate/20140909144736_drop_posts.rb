class DropPosts < ActiveRecord::Migration[5.0]
  def up
    drop_table :posts
  end

  def down
    create_table :posts do |t|
      t.string   :name
      t.string   :slug
      t.boolean  :fix_slug, default: false
      t.integer  :status, default: 0
      t.text     :description
      t.text     :short_description

      t.timestamps
    end
  end
end
