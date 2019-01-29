class Additionalmigration10 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_order_mutexes", force: :cascade do |t|
      t.integer "order_id", null: false
      t.datetime "created_at", precision: 6
      t.index ["order_id"], name: "index_spree_order_mutexes_on_order_id", unique: true
    end
  end
end
