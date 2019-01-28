class NeededMigration2 < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_return_reasons", force: :cascade do |t|
      t.string "name"
      t.boolean "active", default: true
      t.boolean "mutable", default: true
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
    end
  end
end
