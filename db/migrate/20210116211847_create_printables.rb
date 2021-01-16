class CreatePrintables < ActiveRecord::Migration[5.2]
  def change
    create_table :printables do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.text :link
      t.boolean :house, default: false
      t.boolean :marriage, default: false
      t.boolean :pregnancy, default: false
      t.boolean :babies, default: false
      t.boolean :toddlers, default: false
      t.boolean :kids, default: false
      t.boolean :teens, default: false
      t.boolean :balance, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
