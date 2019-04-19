class AddAliasToUserForm < ActiveRecord::Migration[5.0]
  def change
    add_column :user_forms, :alias, :string
  end
end
