class AddBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :avatar, foreign_key: true
    add_column :users, :bio, :text
    add_column :users, :tagline, :string
  end
end
