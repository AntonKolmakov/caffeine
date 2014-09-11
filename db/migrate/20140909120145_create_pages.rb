class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :name
      t.string  :slug
      t.boolean :fix_slug, default: false
      t.integer :status, default: 0
      t.text    :description
      t.text    :short_description
      t.integer :parent_id

      t.timestamps
    end
    add_index :pages, :slug
  end
end
