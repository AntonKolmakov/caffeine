class CreateSeoData < ActiveRecord::Migration[5.0]
  def change
    create_table :seo_data do |t|
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.text :seo_text
      t.references :datable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
