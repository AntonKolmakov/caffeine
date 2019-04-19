class DropCatigories < ActiveRecord::Migration[5.0]
  def up
    drop_table :categories
  end

  def down
    create_table :categories do |t|
      t.string :name
      t.text :content
      t.integer :parent_id

      t.timestamps
    end
  end
end
