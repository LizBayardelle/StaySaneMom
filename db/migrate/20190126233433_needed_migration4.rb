class NeededMigration4 < ActiveRecord::Migration[5.2]
  def change
    # add_column :spree_prices, :country_iso, :string, limit: 2
    # add_index :spree_prices, :country_iso
  end
end
