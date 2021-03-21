class AddCategoryToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :category, :string
  end
end
