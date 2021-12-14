class CreateCategorizationFreebies < ActiveRecord::Migration[5.2]
  def change
    create_table :categorization_freebies do |t|
      t.references :category, foreign_key: true
      t.references :freebie, foreign_key: true

      t.timestamps
    end
  end
end
