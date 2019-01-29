class Additionalmigration13 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_shipping_method_stock_locations", force: :cascade do |t|
      t.integer "shipping_method_id"
      t.integer "stock_location_id"
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
      t.index ["shipping_method_id"], name: "shipping_method_id_spree_sm_sl"
      t.index ["stock_location_id"], name: "sstock_location_id_spree_sm_sl"
    end
  end
end
