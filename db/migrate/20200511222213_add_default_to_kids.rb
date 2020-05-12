class AddDefaultToKids < ActiveRecord::Migration[5.2]
  def change
    change_column :sortings, :pregnancy, :integer, default: 0
    change_column :sortings, :babies, :integer, default: 0
    change_column :sortings, :toddlers, :integer, default: 0
    change_column :sortings, :kids, :integer, default: 0
    change_column :sortings, :teens, :integer, default: 0
  end
end
