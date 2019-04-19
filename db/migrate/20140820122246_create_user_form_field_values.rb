class CreateUserFormFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :user_form_field_values do |t|
      t.string :value
      t.belongs_to :user_form_field, index: true

      t.timestamps
    end
  end
end
