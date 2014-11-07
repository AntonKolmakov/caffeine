class AddRandomTokenToPages < ActiveRecord::Migration
  def change
    add_column :pages, :random_token, :string
  end
end
