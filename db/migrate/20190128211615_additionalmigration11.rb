class Additionalmigration11 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_line_item_actions", force: :cascade do |t|
      t.integer "line_item_id", null: false
      t.integer "action_id", null: false
      t.integer "quantity", default: 0
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
      t.index ["action_id"], name: "index_spree_line_item_actions_on_action_id"
      t.index ["line_item_id"], name: "index_spree_line_item_actions_on_line_item_id"
    end
  end
end
