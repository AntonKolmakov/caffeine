class AddPositionToUserFormField < ActiveRecord::Migration
  def change
    add_column :user_form_fields, :position, :integer
  end
end
