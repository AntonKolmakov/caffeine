class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text    :name
      t.integer :category_id

      t.timestamps
    end
  end
end
