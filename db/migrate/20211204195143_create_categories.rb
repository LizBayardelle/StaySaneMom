class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :active, default: true
      t.string :i_statement
      t.string :cta
      t.text :description
      t.text :intro
      t.string :bad_adjective
      t.string :good_adjective
      t.string :main_photo_url
      t.string :photo_2_url
      t.string :photo_3_url

      t.timestamps
    end
  end
end
