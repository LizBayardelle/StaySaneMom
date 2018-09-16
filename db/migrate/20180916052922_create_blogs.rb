class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :teaser
      t.text :body
      t.string :cta
      t.string :category, default: "General"
      t.string :linked_module
      t.boolean :published, default: false
      t.datetime :published_on
      t.references :user, foreign_key: true
      t.references :image
      t.references :pdf

      t.timestamps
    end
  end
end
