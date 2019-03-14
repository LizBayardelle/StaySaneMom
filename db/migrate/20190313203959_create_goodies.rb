class CreateGoodies < ActiveRecord::Migration[5.2]
  def change
    create_table :goodies do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
