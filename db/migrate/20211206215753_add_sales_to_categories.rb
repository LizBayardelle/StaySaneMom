class AddSalesToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :cta_url, :string
    add_column :categories, :cta_desc, :text
  end
end
