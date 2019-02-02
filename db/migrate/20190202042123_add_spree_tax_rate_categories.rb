class AddSpreeTaxRateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table "spree_tax_rate_tax_categories", id: :serial, force: :cascade do |t|
      t.integer "tax_category_id", null: false
      t.integer "tax_rate_id", null: false
      t.index ["tax_category_id"], name: "index_spree_tax_rate_tax_categories_on_tax_category_id"
      t.index ["tax_rate_id"], name: "index_spree_tax_rate_tax_categories_on_tax_rate_id"
    end
  end
end
