class IndexBlogsOnResource < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :freebie, foreign_key: true
  end
end
