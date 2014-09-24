class AddPageIdToUserForm < ActiveRecord::Migration
  def change
    add_reference :user_forms, :page, index: true
  end
end
