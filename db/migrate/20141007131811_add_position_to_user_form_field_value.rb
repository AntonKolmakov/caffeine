class AddPositionToUserFormFieldValue < ActiveRecord::Migration[5.0]
  def change
    add_column :user_form_field_values, :position, :integer
  end
end
