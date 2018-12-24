class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :category
      t.boolean :active
      t.text :description

      t.timestamps
    end
    add_reference :blogs, :subcategory, index: true
  end
end
