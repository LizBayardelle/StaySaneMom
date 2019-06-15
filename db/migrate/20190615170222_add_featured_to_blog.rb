class AddFeaturedToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :featured_home, :boolean, default: false
    add_column :blogs, :featured_category, :boolean, default: false
  end
end
