class AddPositionToUserFormFieldValue < ActiveRecord::Migration
  def change
    add_column :user_form_field_values, :position, :integer
  end
end
