class AddFreebieIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :freebie, foreign_key: true
    remove_column :categories, :cta_url
  end
end
