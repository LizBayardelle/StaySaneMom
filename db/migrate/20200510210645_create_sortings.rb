class CreateSortings < ActiveRecord::Migration[5.2]
  def change
    create_table :sortings do |t|
      t.integer :house
      t.integer :marriage
      t.integer :pregnancy
      t.integer :babies
      t.integer :toddlers
      t.integer :kids
      t.integer :teens
      t.integer :balance
      t.string :ip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
