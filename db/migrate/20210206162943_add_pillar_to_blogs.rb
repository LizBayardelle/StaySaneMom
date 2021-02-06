class AddPillarToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :pillar, :boolean, default: false
  end
end
