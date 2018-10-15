class DropOccasionsPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :occasions_people
  end
end
