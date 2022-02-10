class CreateSubcategorizationTables < ActiveRecord::Migration[5.2]
  def change

    create_table :subcategorization_blogs do |t|
      t.references :subcategory, foreign_key: true
      t.references :blog, foreign_key: true
      t.timestamps
    end

    create_table :subcategorization_freebies do |t|
      t.references :subcategory, foreign_key: true
      t.references :freebie, foreign_key: true
      t.timestamps
    end

    create_table :subcategorization_solutions do |t|
      t.references :subcategory, foreign_key: true
      t.references :solution, foreign_key: true
      t.timestamps
    end

  end
end
