class AddShortDescriptionToVariations < ActiveRecord::Migration[5.2]
  def change
    add_column :variations, :short_description, :string
  end
end
