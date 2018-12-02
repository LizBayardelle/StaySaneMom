class AddFieldsToBlogAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :freebie_type, :string, default: "File"
    add_column :blogs, :freebie_description, :string
  end
end
