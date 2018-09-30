class AddGroupToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :group, :string
  end
end
