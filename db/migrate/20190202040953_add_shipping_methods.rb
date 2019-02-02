class AddShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_store_shipping_methods", force: :cascade do |t|
      t.bigint "store_id", null: false
      t.bigint "shipping_method_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["shipping_method_id"], name: "index_spree_store_shipping_methods_on_shipping_method_id"
      t.index ["store_id"], name: "index_spree_store_shipping_methods_on_store_id"
    end
  end
end
