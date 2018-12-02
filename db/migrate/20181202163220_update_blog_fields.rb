class UpdateBlogFields < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :freebie_filename, :string
    add_column :blogs, :video_link, :string
  end
end
