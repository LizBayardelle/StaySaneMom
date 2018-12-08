class UpdateBlogCommentsCount < ActiveRecord::Migration[5.2]
  def change
    Blog.find_each do |blog|
      Blog.reset_counters(blog.id, :comments)
    end
  end
end
