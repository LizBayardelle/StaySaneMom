class AddCommentsCountToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :comments_count, :integer
  end
end
