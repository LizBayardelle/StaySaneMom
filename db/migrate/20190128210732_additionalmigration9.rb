class Additionalmigration9 < ActiveRecord::Migration[5.2]
  def change
    # drop_table :spree_option_value_variants
    create_table "spree_option_values_variants", force: :cascade do |t|
      t.integer "variant_id"
      t.integer "option_value_id"
      t.datetime "created_at", precision: 6
      t.datetime "updated_at", precision: 6
      t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id"
      t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id"
    end
  end
end
