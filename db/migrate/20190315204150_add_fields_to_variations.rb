class AddFieldsToVariations < ActiveRecord::Migration[5.2]
  def change
    add_column :variations, :custom_planner, :boolean, default: false
    add_column :variations, :build_planner, :boolean, default: false
    add_column :variations, :downloadable, :boolean, default: false
  end
end
