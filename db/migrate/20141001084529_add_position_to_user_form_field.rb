class AddPositionToUserFormField < ActiveRecord::Migration[5.0]
  def change
    add_column :user_form_fields, :position, :integer
  end
end
