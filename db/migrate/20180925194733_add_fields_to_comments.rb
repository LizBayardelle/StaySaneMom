class AddFieldsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :approved, :boolean, default: false
    add_column :comments, :read, :boolean, default: false
    add_column :comments, :email, :string
    add_column :comments, :name, :string
  end
end
