class AddFieldsToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :category, :string
    add_column :subcategories, :description, :text
    add_column :subcategories, :active, :boolean, default: true
  end
end
