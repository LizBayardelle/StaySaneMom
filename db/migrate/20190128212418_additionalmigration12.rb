class Additionalmigration12 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_user_addresses", force: :cascade do |t|
      t.integer "user_id", null: false
      t.integer "address_id", null: false
      t.boolean "default", default: false
      t.boolean "archived", default: false
      t.datetime "created_at", null: false, precision: 6
      t.datetime "updated_at", null: false, precision: 6
      t.index ["address_id"], name: "index_spree_user_addresses_on_address_id"
      t.index ["user_id", "address_id"], name: "index_spree_user_addresses_on_user_id_and_address_id", unique: true
      t.index ["user_id"], name: "index_spree_user_addresses_on_user_id"
    end
  end
end
