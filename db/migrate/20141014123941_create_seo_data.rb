class CreateSeoData < ActiveRecord::Migration
  def change
    create_table :seo_data do |t|
      t.string :meta_title
      t.string :meta_keys
      t.text :meta_description
      t.text :seo_text
      t.references :datable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
