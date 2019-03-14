class CreateJoinTableVariationsGroupings < ActiveRecord::Migration[5.2]
  def change
    create_join_table :variations, :groupings, table_name: :variation_grouping do |t|
      t.index [:variation_id, :grouping_id]
      t.index [:grouping_id, :variation_id]
    end
  end
end
