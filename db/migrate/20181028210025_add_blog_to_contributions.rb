class AddBlogToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :blog, :string
  end
end
