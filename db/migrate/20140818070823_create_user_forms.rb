class CreateUserForms < ActiveRecord::Migration[5.0][5.0]
  def change
    create_table :user_forms do |t|
      t.string :name
      t.string :email
      t.text :properties

      t.timestamps
    end
  end
end
