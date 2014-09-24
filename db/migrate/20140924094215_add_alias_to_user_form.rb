class AddAliasToUserForm < ActiveRecord::Migration
  def change
    add_column :user_forms, :alias, :string
  end
end
