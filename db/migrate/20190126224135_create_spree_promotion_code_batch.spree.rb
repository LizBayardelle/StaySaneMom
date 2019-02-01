# frozen_string_literal: true
# This migration comes from spree (originally 20161017102621)

class CreateSpreePromotionCodeBatch < ActiveRecord::Migration[5.0]
  def change
    # create_table :spree_promotion_code_batches do |t|
    #   t.references :promotion, null: false, index: true
    #   t.string :base_code, null: false
    #   t.integer :number_of_codes, null: false
    #   t.string :email
    #   t.string :error
    #   t.string :state, default: "pending"
    #   t.timestamps precision: 6
    # end

    # create_table :spree_promotion_codes do |t|  << OLD ONE
    #   t.integer :promotion_id, null: false
    #   t.string :value, null: false
    #   t.integer :promotion_code_batch_id
    #   t.timestamps precision: 6
    # end

    # create_table :spree_promotion_codes do |t|  << MINE
    #   t.integer :promotion_id, null: false
    #   t.string :value, null: false
    #   t.integer :promotion_id, null: false
    #   t.integer :promotion_code_batch_id
    #   t.timestamps precision: 6
    #   t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id"
    #   t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true
    # end

    # add_foreign_key(
    #   :spree_promotion_code_batches,
    #   :spree_promotions,
    #   column: :promotion_id
    # )
    #
    # add_foreign_key(
    #   :spree_promotion_codes,
    #   :spree_promotion_code_batches,
    #   column: :promotion_code_batch_id
    # )

    # add_index(
    #   :spree_promotion_codes,
    #   :promotion_code_batch_id
    # )
  end
end
