class NeededMigration1 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_store_credit_update_reasons", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
    end
  end
end
