class AddGoodAdjectiveToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :good_adjective, :string
  end
end
