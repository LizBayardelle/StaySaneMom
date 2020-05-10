class AddCategoriesToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :house, :boolean, default: false
    add_column :blogs, :marriage, :boolean, default: false
    add_column :blogs, :pregnancy, :boolean, default: false
    add_column :blogs, :babies, :boolean, default: false
    add_column :blogs, :toddlers, :boolean, default: false
    add_column :blogs, :kids, :boolean, default: false
    add_column :blogs, :teens, :boolean, default: false
    add_column :blogs, :balance, :boolean, default: false
  end
end
