class FixOccasionBelonging < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :occasions, index: true
    remove_column :occasions, :person
  end
end
