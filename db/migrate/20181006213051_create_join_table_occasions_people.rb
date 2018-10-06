class CreateJoinTableOccasionsPeople < ActiveRecord::Migration[5.2]
  def change
    create_join_table :occasions, :people do |t|
      # t.index [:occasion_id, :person_id]
      # t.index [:person_id, :occasion_id]
    end
  end
end
