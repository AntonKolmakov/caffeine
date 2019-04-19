class AddRandomTokenToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :random_token, :string
  end
end
