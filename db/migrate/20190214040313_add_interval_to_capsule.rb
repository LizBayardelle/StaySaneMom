class AddIntervalToCapsule < ActiveRecord::Migration[5.2]
  def change
    add_column :capsules, :interval, :string, default: "Yearly"
  end
end
