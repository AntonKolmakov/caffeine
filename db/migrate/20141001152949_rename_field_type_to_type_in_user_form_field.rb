class RenameFieldTypeToTypeInUserFormField < ActiveRecord::Migration
  def change
    rename_column :user_form_fields, :field_type, :type
  end
end
