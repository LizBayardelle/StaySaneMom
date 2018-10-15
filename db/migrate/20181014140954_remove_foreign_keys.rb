class RemoveForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :people, name: :occasions_id
    remove_foreign_key :occasions, name: :person_id
    remove_index :people, name: :index_people_on_occasions_id
    remove_index :occasions, name: :index_occasions_on_person_id
  end
end
