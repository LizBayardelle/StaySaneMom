class Additionalmigration19 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_store_payment_methods", force: :cascade do |t|
      t.integer "store_id", null: false
      t.integer "payment_method_id", null: false
      t.datetime "created_at", null: false, precision: 6
      t.datetime "updated_at", null: false, precision: 6
      t.index ["payment_method_id"], name: "index_spree_store_payment_methods_on_payment_method_id"
      t.index ["store_id"], name: "index_spree_store_payment_methods_on_store_id"
    end
  end
end
