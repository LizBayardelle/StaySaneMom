class AddPinterestToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :pin_image
    add_column :blogs, :data_pin_description, :string
  end
end
