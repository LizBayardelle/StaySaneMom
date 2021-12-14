class CreateCategorizationBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :categorization_blogs do |t|
      t.references :category, foreign_key: true
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
