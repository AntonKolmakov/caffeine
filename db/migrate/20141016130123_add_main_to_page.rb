class AddMainToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :main, :boolean, default: false
  end
end
