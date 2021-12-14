class AddThrivelinkToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :thrivelink, :string
    add_column :printables, :thrivelink, :string
  end
end
