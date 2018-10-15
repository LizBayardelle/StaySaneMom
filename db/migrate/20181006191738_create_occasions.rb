class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.string :name
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
