class CreateGroupings < ActiveRecord::Migration[5.2]
  def change
    create_table :groupings do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
