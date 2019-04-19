class RemoveNameFromUserFormField < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_form_fields, :name
  end
end
