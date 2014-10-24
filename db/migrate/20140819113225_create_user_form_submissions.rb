class CreateUserFormSubmissions < ActiveRecord::Migration
  def change
    create_table :user_form_submissions do |t|
      t.belongs_to :user_form, index: true
      t.text :field_values

      t.timestamps
    end
  end
end
