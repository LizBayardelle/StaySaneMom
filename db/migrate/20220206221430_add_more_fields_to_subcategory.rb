class AddMoreFieldsToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :i_statement, :string
    add_column :subcategories, :cta, :string
    add_column :subcategories, :intro, :text
    add_column :subcategories, :bad_adjective, :string
    add_column :subcategories, :main_photo_url, :string
    add_column :subcategories, :photo_2_url, :string
    add_column :subcategories, :photo_3_url, :string
    add_column :subcategories, :cta_desc, :text
    remove_column :subcategories, :category
    add_reference :subcategories, :freebie, foreign_key: true
    add_reference :subcategories, :category, foreign_key: true
  end
end
