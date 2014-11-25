class CreateMenuElementTypes < ActiveRecord::Migration
  def change
    create_table :menu_element_types do |t|
      t.string :name
      t.string :type
      t.belongs_to :menu_element, index: true

      t.timestamps
    end
  end
end
