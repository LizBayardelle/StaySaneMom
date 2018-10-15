class AddGiftsToOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :store
      t.text :notes
      t.boolean :purchased, default: false
      t.references :user, foreign_key: true
      t.belongs_to :person, :null => false, :index => true
      t.belongs_to :occasion, :null => false, :index => true
      t.timestamps
    end
  end
end
