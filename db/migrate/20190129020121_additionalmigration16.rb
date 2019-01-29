class Additionalmigration16 < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_shipping_methods, :carrier, :string
  end
end
