class CreatePageImages < ActiveRecord::Migration[5.0]
  def change
    create_table :page_images do |t|
      t.string :picture
      t.belongs_to :page

      t.timestamps
    end
  end
end
