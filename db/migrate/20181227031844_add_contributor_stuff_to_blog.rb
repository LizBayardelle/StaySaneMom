class AddContributorStuffToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :approved, :boolean, default: false
    add_column :blogs, :submitted, :boolean, default: false
  end
end
