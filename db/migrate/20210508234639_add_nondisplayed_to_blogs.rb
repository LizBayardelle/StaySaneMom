class AddNondisplayedToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :nondisplayed, :boolean, default: false
  end
end
