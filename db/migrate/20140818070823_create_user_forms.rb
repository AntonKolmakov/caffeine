class CreateUserForms < ActiveRecord::Migration
  def change
    create_table :user_forms do |t|
      t.string :name
      t.string :email
      t.text :properties

      t.timestamps
    end
  end
end
