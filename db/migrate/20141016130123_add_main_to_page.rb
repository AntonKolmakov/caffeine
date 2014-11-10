class AddMainToPage < ActiveRecord::Migration
  def change
    add_column :pages, :main, :boolean, default: false
  end
end
