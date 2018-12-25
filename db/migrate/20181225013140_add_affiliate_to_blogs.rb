class AddAffiliateToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :affiliate_links, :boolean, default: true
  end
end
