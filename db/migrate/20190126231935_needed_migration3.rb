class NeededMigration3 < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_stores, :cart_tax_country_iso, :string
  end
end
