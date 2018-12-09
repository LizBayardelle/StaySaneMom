class AddUserToOccasions < ActiveRecord::Migration[5.2]
  def change
    add_reference :occasions, :user, foreign_key: true
  end
end
