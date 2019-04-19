class RenameFieldTypeToTypeInUserFormField < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_form_fields, :field_type, :type
  end
end
