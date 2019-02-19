class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.integer :ready_in_minutes
      t.attachment :image
      t.boolean :gluten_free, default: false
      t.boolean :dairy_free, default: false
      t.boolean :vegetarian, default: false
      t.boolean :vegan, default: false
      t.text :ingredients, array: true, default: []
      t.text :instructions, array: true, default: []
      t.boolean :downloaded, default: false
      t.boolean :favorite, default: false
      t.references :user, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
