class Additionalmigration5 < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :guest_token, :string
    add_index :spree_orders, :guest_token
  end
end
