class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :teaser
      t.string :freebie_type
      t.text :freebie_description
      t.string :cta
      t.string :convertkit_href
      t.boolean :link_instead, default: false
      t.string :link_url
      t.boolean :house, default: false
      t.boolean :spouse, default: false
      t.boolean :kids, default: false
      t.boolean :self, default: false
      t.boolean :active, default: true

      t.timestamps
    end

    create_table "resource_categorizations", force: :cascade do |t|
      t.bigint "resource_id"
      t.bigint "subcategory_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["resource_id"], name: "index_resource_categorizations_on_resource_id"
      t.index ["subcategory_id"], name: "index_resource_categorizations_on_subcategory_id"
    end
  end
end
