class AddLinksToVariations < ActiveRecord::Migration[5.2]
  def change
    add_column :variations, :link_instead, :boolean, default: false
    add_column :variations, :link_url, :string
  end
end
