class Additionalmigration7 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_orders_promotions", force: :cascade do |t|
      t.integer "order_id"
      t.integer "promotion_id"
      t.integer "promotion_code_id"
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
      t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id"
      t.index ["promotion_code_id"], name: "index_spree_orders_promotions_on_promotion_code_id"
    end
  end
end
