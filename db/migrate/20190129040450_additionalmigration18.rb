class Additionalmigration18 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_shipping_rate_taxes", force: :cascade do |t|
      t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
      t.integer "tax_rate_id"
      t.integer "shipping_rate_id"
      t.datetime "created_at", null: false, precision: 6
      t.datetime "updated_at", null: false, precision: 6
      t.index ["shipping_rate_id"], name: "index_spree_shipping_rate_taxes_on_shipping_rate_id"
      t.index ["tax_rate_id"], name: "index_spree_shipping_rate_taxes_on_tax_rate_id"
    end
  end
end
