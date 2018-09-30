class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :relationship
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.date :anniversary
      t.date :other
      t.string :other_date_name
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
