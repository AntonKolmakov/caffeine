class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.string :name
      t.string :type
      t.belongs_to :menu_element, index: true

      t.timestamps
    end
  end
end
