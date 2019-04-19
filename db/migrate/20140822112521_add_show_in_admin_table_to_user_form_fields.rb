class AddShowInAdminTableToUserFormFields < ActiveRecord::Migration[5.0]
  def change
    add_column :user_form_fields, :show_in_admin_table, :boolean, default: false, nil: true
    add_index :user_form_fields, :show_in_admin_table
  end
end
