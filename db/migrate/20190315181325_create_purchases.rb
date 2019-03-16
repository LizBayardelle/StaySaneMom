class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :first_name
      t.string :last_name
      t.string :shipping_1
      t.string :shipping_2
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip
      t.string :shipping_country
      t.string :phone
      t.decimal :total
      t.references :basket, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
