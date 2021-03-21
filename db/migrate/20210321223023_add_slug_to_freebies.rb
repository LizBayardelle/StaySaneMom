class AddSlugToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :slug, :string
    add_index :freebies, :slug, unique: true
  end
end
