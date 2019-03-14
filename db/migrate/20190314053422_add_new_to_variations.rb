class AddNewToVariations < ActiveRecord::Migration[5.2]
  def change
    add_column :variations, :new_product, :boolean, default: true
    add_column :variations, :hot_product, :boolean, default: false
  end
end
