class CreateCategorizationSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :categorization_solutions do |t|
      t.references :category, foreign_key: true
      t.references :solution, foreign_key: true

      t.timestamps
    end
  end
end
