class AddOrientationToCapsule < ActiveRecord::Migration[5.2]
  def change
    add_column :capsules, :photo_orientation, :string, default: "Square"
  end
end
