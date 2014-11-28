class CreateMenuElements < ActiveRecord::Migration
  def change
    create_table :menu_elements do |t|
      t.string :name
      t.string :element_type
      t.belongs_to :menu_element_type, index: true

      t.timestamps
    end
  end
end
