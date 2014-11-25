class CreateMenuElements < ActiveRecord::Migration
  def change
    create_table :menu_elements do |t|
      t.string :name

      t.timestamps
    end
  end
end
