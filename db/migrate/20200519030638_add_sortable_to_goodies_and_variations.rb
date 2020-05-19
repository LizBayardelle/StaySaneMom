class AddSortableToGoodiesAndVariations < ActiveRecord::Migration[5.2]
  def change
    add_column :goodies, :sort, :integer
    add_column :variations, :sort, :integer
  end
end
