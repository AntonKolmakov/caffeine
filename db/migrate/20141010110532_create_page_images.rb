class CreatePageImages < ActiveRecord::Migration
  def change
    create_table :page_images do |t|
      t.string :picture
      t.belongs_to :page

      t.timestamps
    end
  end
end
