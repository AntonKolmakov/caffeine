class RemoveNameFromUserFormField < ActiveRecord::Migration
  def change
    remove_column :user_form_fields, :name
  end
end
