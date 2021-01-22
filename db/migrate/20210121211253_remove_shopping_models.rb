class RemoveShoppingModels < ActiveRecord::Migration[5.2]
  def change
    drop_table :basket_items, force: :cascade
    drop_table :basket_statuses, force: :cascade
    drop_table :baskets, force: :cascade
    drop_table :goodies, force: :cascade
    drop_table :planner_customs, force: :cascade
    drop_table :purchases, force: :cascade
    drop_table :resource_categorizations, force: :cascade
    drop_table :resources, force: :cascade
    drop_table :variation_grouping, force: :cascade
    drop_table :variations, force: :cascade
  end
end
