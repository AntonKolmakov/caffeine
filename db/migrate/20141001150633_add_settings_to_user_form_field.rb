class AddSettingsToUserFormField < ActiveRecord::Migration
  def change
    add_column :user_form_fields, :settings, :text
  end
end
