class ChangePosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :status, :integer, default: 0
    add_column :posts, :description, :text
    add_column :posts, :short_description, :text
    reversible do |dir|
      dir.up do
        change_column :posts, :name, :string
      end

      dir.down do
        change_column :posts, :name, :text
      end
    end
  end
end
