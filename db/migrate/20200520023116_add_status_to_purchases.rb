class AddStatusToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :status, :string, default: "Abandoned Pre-Checkout"
    drop_table :comments, force: :cascade
    # drop_table :solidus_paypal_braintree_configurations, force: :cascade
    # drop_table :solidus_paypal_braintree_customers, force: :cascade
    # drop_table :solidus_paypal_braintree_sources, force: :cascade
  end
end
