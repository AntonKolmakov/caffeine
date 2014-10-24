class AddShowInAdminTableToUserFormFields < ActiveRecord::Migration
  def change
    add_column :user_form_fields, :show_in_admin_table, :boolean, default: false, nil: true
    add_index :user_form_fields, :show_in_admin_table
  end
end
