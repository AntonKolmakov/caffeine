class CreateUserFormFields < ActiveRecord::Migration
  def change
    create_table :user_form_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :user_form, index: true

      t.timestamps
    end
  end
end
