class AddPageIdToUserForm < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_forms, :page, index: true
  end
end
