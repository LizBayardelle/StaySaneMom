class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.references :person, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
