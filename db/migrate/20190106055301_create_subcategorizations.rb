class CreateSubcategorizations < ActiveRecord::Migration[5.2]
  def change
    # drop_table :subcategories
    create_table :subcategories do |t|
      t.string :name
      t.timestamps
    end
    create_table :subcategorizations do |t|
      t.belongs_to :subcategory, index: true
      t.belongs_to :blog, index: true
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
